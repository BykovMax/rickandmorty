import 'package:domain/domain.dart';
import 'package:entities/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'characters_store.g.dart';

class CharactersStore = CharactersStoreBase with _$CharactersStore;

abstract class CharactersStoreBase with Store {
  final SearchCharactersUseCase _searchCharactersUseCase = GetIt.instance.get();

  CharactersStoreBase() {
    _load();
  }

  @observable
  LoadingStateCharacters _state = Loading();

  @computed
  LoadingStateCharacters get state {
    return _state;
  }

  Future<void> _load() async {
    _state = Loading();
    _searchCharactersUseCase.searchCharacters(_filter).listen((characters) {
      _state = Result(characters);
    }, onError: (err) {
      _state = Error();
    });
  }

  @observable
  Filter _filter = Filter.empty();

  @action
  void typeSearch(String text) {
    _filter = _filter.copyWith(query: text);
    _searchCharactersUseCase.updateFilter(_filter);
  }
}

sealed class LoadingStateCharacters {}

class Loading extends LoadingStateCharacters {}

class Error implements LoadingStateCharacters {}

@immutable
class Result extends LoadingStateCharacters {
  final List<Character> characters;

  Result(this.characters);
}
