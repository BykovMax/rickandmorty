import 'dart:async';

import 'package:domain/domain.dart';
import 'package:entities/entities.dart' as entity;
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:server/server.dart';

@injectable
class SearchCharactersUseCase {
  final RestClient _client = GetIt.instance.get();
  final BehaviorSubject<Filter> _input = BehaviorSubject();

  Stream<List<entity.Character>> searchCharacters(Filter filter) {
    _input.add(filter);
    return _createOutputStream(_input);
  }

  Stream<List<entity.Character>> _createOutputStream(Stream<Filter> input) => input
      .debounceTime(Duration(milliseconds: 250))
      .distinct()
      .switchMap(
        (filter) => Stream.fromFuture(_client.searchCharacters(
          filter.query,
          filter.species.value,
          filter.status.value,
          filter.gender.value,
        )),
      )
      .map((page) => page.results.map((e) => _toEntity(e, false)).toList());

  void updateFilter(Filter filter) {
    _input.add(filter);
  }
}

entity.Character _toEntity(Character character, bool isFavourite) => entity.Character(
      character.id!,
      character.name!,
      character.species!,
      character.status!,
      character.image!,
      isFavourite,
    );
