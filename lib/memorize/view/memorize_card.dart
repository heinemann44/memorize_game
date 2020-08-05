import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memorize/memorize/store/memorize_card_store.dart';
import 'package:memorize/memorize/store/memorize_controller.dart';

class MemorizeCard extends StatefulWidget {
  final MemorizeController controller;
  final Function reset;
  final MemorizeCardStore cardStore;

  const MemorizeCard({
    Key key,
    this.controller,
    this.reset,
    this.cardStore,
  }) : super(key: key);

  @override
  _MemorizeCardState createState() => _MemorizeCardState();
}

class _MemorizeCardState extends State<MemorizeCard>
    with SingleTickerProviderStateMixin {
  bool get opacity => this.widget.controller.state.cardsFounded.contains(this.widget.cardStore.icon);

  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    this._animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    this._animation = Tween<double>(begin: 0, end: 1).animate(this._animationController);
    this._animation.addListener(() => setState(() {}));
    this._animation.addStatusListener((status) => this._animationStatus = status);

    this.widget.cardStore.animationController = this._animationController;
  }

  @override
  void dispose() {
    this._animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateY(pi * this._animation.value),
      child: InkWell(
        onTap: this._handleOnTapMemorizeCard,
        child: Opacity(
          opacity: this.opacity ? 0 : 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(8),
            child: this._animation.value >= 0.5
                ? this._buildFrontMemorize()
                : this._buildBackMemorize(),
          ),
        ),
      ),
    );
  }

  void _handleOnTapMemorizeCard() {
    if (this._animationStatus == AnimationStatus.dismissed) {
      this._animationController.forward().then((_) {
        this.widget.controller.sameCard(this.widget.cardStore);
      });
    }
  }

  Widget _buildFrontMemorize() {
    return Icon(this.widget.cardStore.icon, size: 48);
  }

  Widget _buildBackMemorize() {
    return Container(color: Colors.black12);
  }
}
