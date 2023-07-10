import 'package:domain/domain.dart';
import 'package:entities/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = CharacterStoreBase with _$CharacterStore;

abstract class CharacterStoreBase with Store {
  final GetCharacterUseCase _getCharacterUseCase = GetIt.instance.get();
  final MarkFavouriteUseCase _markFavoriteUseCase = GetIt.instance.get();
  final MarkUnFavouriteUseCase _markUnFavoriteUseCase = GetIt.instance.get();

  late final String _id;
  @observable
  LoadingState _state = Loading();

  CharacterStoreBase(String id) {
    _id = id;
    _load();
  }

  Future<void> _load() async {
    _state = Loading();
    _getCharacterUseCase.getCharacter(_id).listen((event) {
      _state = Result(event);
    }, onError: (err) {
      _state = Error();
    });
  }

  @computed
  LoadingState get state {
    return _state;
  }

  @action
  void addToFavorites() {
    _markFavoriteUseCase.markFavourite(_id);
  }

  @action
  void removeFromFavorites() {
    _markUnFavoriteUseCase.markUnFavourite(_id);
  }
}

sealed class LoadingState {}

class Loading extends LoadingState {}

class Error implements LoadingState {}

@immutable
class Result extends LoadingState {
  final Character character;

  Result(this.character);
}
