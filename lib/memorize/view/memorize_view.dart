import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memorize/memorize/store/memorize_controller.dart';
import 'package:memorize/memorize/store/memorize_store.dart';
import 'package:memorize/memorize/view/memorize_card.dart';

class MemorizeView extends StatefulWidget {
  final MemorizeController controller;

  const MemorizeView({Key key, this.controller}) : super(key: key);

  @override
  _MemorizeViewState createState() => _MemorizeViewState();
}

class _MemorizeViewState extends State<MemorizeView> {
  MemorizeForm get state => this.widget.controller.state;

  MemorizeStore store;

  @override
  void initState() {
    super.initState();
    this.store = MemorizeStore();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return GridView.builder(
          itemCount: this.store.cards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (_, index) {
            return Observer(
              builder: (_) => MemorizeCard(
                controller: this.widget.controller,
                cardStore: this.store.cards[index],
              ),
            );
          },
        );
      },
    );
  }
}
