import 'dart:async';

import 'package:entities/entities.dart' as entity;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:server/server.dart';

@injectable
class GetCharacterUseCase {
  final RestClient client = GetIt.instance.get();

  Stream<entity.Character> getCharacter(String id) async* {
    final character = await client.character(id);
    character.toString();
    final result = await _toEntity(character);
    yield result;
  }

  Future<entity.Character> _toEntity(Character character) async {
    return entity.Character(
      character.id!,
      character.name!,
      character.species!,
      character.status!,
      character.image!,
      await getFavoriteById(character.id!.toString()),
    );
  }

  Future<bool> getFavoriteById(String id) async {
    Future.delayed(Duration(milliseconds: 200));
    return false;
  }
}
