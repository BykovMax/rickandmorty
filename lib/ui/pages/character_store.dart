import 'package:entities/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:server/server.dart';

part 'character_store.g.dart';

class CharacterStore = CharacterStoreBase with _$CharacterStore;

abstract class CharacterStoreBase with Store {
  final RestClient client = GetIt.instance.get();

  late final String _id;
  @observable
  LoadingState _loading = Loading();

  CharacterStoreBase(String id) {
    _id = id;
    _load();
  }

  Future<void> _load() async {
    _loading = Loading();
    try {
      final results = await Future.wait([
        client.character(_id),
        Future.delayed(
          const Duration(milliseconds: 1500),
        ),
      ]);
      print("result: ${results.first}");
      _loading = Result(Character.demo(int.parse(_id))); //todo use  Character via repo
      // }
    } catch (e) {
      _loading = Error();
    }
  }

  @computed
  LoadingState get loading {
    return _loading;
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
