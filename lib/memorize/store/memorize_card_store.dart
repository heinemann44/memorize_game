import 'package:flutter/cupertino.dart';
import 'package:memorize/memorize/models/memorize_card_model.dart';
import 'package:mobx/mobx.dart';

part 'memorize_card_store.g.dart';

class MemorizeCardStore = _MemorizeCardStore with _$MemorizeCardStore;

abstract class _MemorizeCardStore with Store {
  int id;
  IconData icon;
  AnimationController animationController;

  @observable
  bool isFront = false;

  _MemorizeCardStore({
    this.id,
    this.icon,
    this.isFront,
  });

  _MemorizeCardStore.fromModel(MemorizeCardModel model){
    this.id = model.id;
    this.icon = model.icon;
    this.isFront = false;
  }

  @action
  void setIsFront() {
    if(this.isFront){
      this.animationController.reverse();
    }else {
      this.animationController.forward();
    }
    this.isFront = !this.isFront;
  }
}
