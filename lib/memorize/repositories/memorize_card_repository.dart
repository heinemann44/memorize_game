import 'package:flutter/material.dart';
import 'package:memorize/icon_utils.dart';
import 'package:memorize/memorize/models/memorize_card_model.dart';

class MemorizeCardRepository {
  List<MemorizeCardModel> getCards(int quantityCards) {
    List<IconData> symbolsCards = IconUtils.getRandom(quantity: quantityCards);
    int id = 1;
    return symbolsCards.map((symbol) {
      return MemorizeCardModel(id: id++, icon: symbol);
    }).toList();
  }
}
