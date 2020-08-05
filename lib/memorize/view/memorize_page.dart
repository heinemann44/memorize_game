import 'package:flutter/material.dart';
import 'package:memorize/memorize/store/memorize_controller.dart';
import 'package:memorize/memorize/view/memorize_view.dart';

class MemorizePage extends StatefulWidget {
  @override
  _MemorizePageState createState() => _MemorizePageState();
}

class _MemorizePageState extends State<MemorizePage> {
  MemorizeController controller;

  @override
  void initState() {
    super.initState();
    this.controller = MemorizeController();
    this.controller.initState();
    this.controller.startNewGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MemorizeView(
        key: UniqueKey(),
        controller: this.controller,
      ),
      bottomNavigationBar: this._buildResetButton(),
    );
  }

  Widget _buildResetButton() {
    return RaisedButton(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Reset", style: TextStyle(fontSize: 40)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: this._reset,
    );
  }

  void _reset() {
    setState(() => this.controller.startNewGame());
  }
}
