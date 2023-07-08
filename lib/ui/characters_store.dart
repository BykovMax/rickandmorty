import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:rickandmorty/api/server.dart';
import 'package:rickandmorty/entities/character.dart';

part 'characters_store.g.dart';

class CharactersStore = CharactersStoreBase with _$CharactersStore;

abstract class CharactersStoreBase with Store {
  final client = RestClient(Dio());

  @computed
  List<Character> get items {
    return _items;
  }

  @observable
  List<Character> _items = List.empty();

  int _counter = 0;
  final List<Character> _itemsAll = List<Character>.generate(10000, (i) => Character.demo(i));

  @action
  void increment() {
    ++_counter;
    _items = _itemsAll.getRange(0, _counter).toList();
  }
}