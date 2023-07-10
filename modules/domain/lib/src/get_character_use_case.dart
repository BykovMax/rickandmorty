import 'dart:async';

import 'package:entities/entities.dart' as entity;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:server/server.dart';

@injectable
class GetCharacterUseCase {
  final RestClient client = GetIt.instance.get();
  final Repository repository = GetIt.instance.get();

  Stream<entity.Character> getCharacter(String id) {
    return CombineLatestStream.combine2(
      Stream.fromFuture(client.character(id)),
      repository.isFavourite(id),
      (apiModel, isFavourite) => _toEntity(apiModel, isFavourite),
    );
  }

  entity.Character _toEntity(Character character, bool isFavourite) => entity.Character(
        character.id!,
        character.name!,
        character.species!,
        character.status!,
        character.image!,
        isFavourite,
      );

  Future<bool> getFavouriteById(String id) async {
    return repository.isFavourite(id).first;
  }
}
