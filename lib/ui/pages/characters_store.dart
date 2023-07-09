import 'package:entities/entities.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:server/server.dart';
part 'characters_store.g.dart';

class CharactersStore = CharactersStoreBase with _$CharactersStore;

abstract class CharactersStoreBase with Store {
  final RestClient client = GetIt.instance.get();

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
