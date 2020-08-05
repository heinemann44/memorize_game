import 'package:flutter/material.dart';
import 'package:memorize/memorize/store/memorize_card_store.dart';

class MemorizeForm {
  List<IconData> cardsFounded;
  MemorizeCardStore selectedCard;
}

class MemorizeController {
  MemorizeForm state;

  void initState() {
    this.state = MemorizeForm();
    this.state.cardsFounded = List();
  }

  void startNewGame() {
    this.state.cardsFounded.clear();
    this.resetCardsSelected();
  }

  void sameCard(MemorizeCardStore card) {
    // show up card
    card.setIsFront();

    // if is first card add to selected card
    if (this.state.selectedCard == null) {
      this.state.selectedCard = card;
      // if is second card compare
    } else {
      if (card.icon.codePoint == this.state.selectedCard.icon.codePoint) {
        this.state.cardsFounded.add(card.icon);
      }
      card.setIsFront();
      this.resetCardsSelected();
    }
  }

  void resetCardsSelected() {
    if (this.state.selectedCard != null) {
      this.state.selectedCard.setIsFront();
      this.state.selectedCard = null;
    }
  }
}
