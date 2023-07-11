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

  @computed
  Filter get filter {
    return _filter;
  }

  @computed
  bool get isFilterActive {
    var conditions = [
      _filter.species == CharacterSpecies.empty,
      _filter.status == CharacterStatus.empty,
      _filter.gender == CharacterGender.empty
    ];
    var foundUnClear = false;
    for (var item in conditions) {
      if (!item) {
        foundUnClear = true;
        break;
      }
    }
    return foundUnClear;
  }

  @action
  void typeSearch(String text) {
    _updateFilter(_filter.copyWith(query: text));
  }

  @action
  void setGender(CharacterGender gender) {
    _updateFilter(_filter.copyWith(gender: gender));
  }

  @action
  void setSpecies(CharacterSpecies species) {
    _updateFilter(_filter.copyWith(species: species));
  }

  @action
  void setStatus(CharacterStatus status) {
    _updateFilter(_filter.copyWith(status: status));
  }

  @action
  void clearFilter() {
    _updateFilter(Filter.empty().copyWith(query: _filter.query));
  }

  void _updateFilter(Filter filter) {
    if (_filter == filter) return;
    _state = Loading();
    _filter = filter;
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
