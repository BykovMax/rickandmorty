import 'package:domain/domain.dart';
import 'package:entities/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'character_store.g.dart';

class CharacterStore = CharacterStoreBase with _$CharacterStore;

abstract class CharacterStoreBase with Store {
  final GetCharacterUseCase getCharacterUseCase = GetIt.instance.get();

  late final String _id;
  @observable
  LoadingState _state = Loading();

  CharacterStoreBase(String id) {
    _id = id;
    _load();
  }

  Future<void> _load() async {
    _state = Loading();
    try {
      final results = await Future.wait([
        getCharacterUseCase.getCharacter(_id).first,
        Future.delayed(
          const Duration(milliseconds: 250),
        ),
      ]);
      print("result1: ${results.first}");
      print("result2: ${results[1]}");
      _state = Result(results.first);
    } catch (e) {
      _state = Error();
    }
  }

  @computed
  LoadingState get state {
    return _state;
  }

  @action
  void addToFavorites() {
    //todo
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
