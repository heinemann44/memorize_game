import 'package:memorize/memorize/models/memorize_card_model.dart';
import 'package:memorize/memorize/repositories/memorize_card_repository.dart';
import 'package:memorize/memorize/store/memorize_card_store.dart';
import 'package:mobx/mobx.dart';

part 'memorize_store.g.dart';

class MemorizeStore = _MemorizeStore with _$MemorizeStore;

abstract class _MemorizeStore with Store {
  MemorizeCardRepository repository;

  @observable
  ObservableList<MemorizeCardStore> cards;

  _MemorizeStore() {
    this.repository = MemorizeCardRepository();
    this.getCards();
  }

  @action
  void getCards() {
    List<MemorizeCardModel> list = List();
    List<MemorizeCardModel> listAux = List();

    listAux = this.repository.getCards(10);

    list.addAll(listAux);
    list.addAll(listAux);

    list.shuffle();

    this.cards = list
        .map((element) => MemorizeCardStore.fromModel(element))
        .toList()
        .asObservable();
  }
}
