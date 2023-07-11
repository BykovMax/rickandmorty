// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on CharactersStoreBase, Store {
  Computed<LoadingStateCharacters>? _$stateComputed;

  @override
  LoadingStateCharacters get state =>
      (_$stateComputed ??= Computed<LoadingStateCharacters>(() => super.state,
              name: 'CharactersStoreBase.state'))
          .value;

  late final _$_stateAtom =
      Atom(name: 'CharactersStoreBase._state', context: context);

  @override
  LoadingStateCharacters get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(LoadingStateCharacters value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_filterAtom =
      Atom(name: 'CharactersStoreBase._filter', context: context);

  @override
  Filter get _filter {
    _$_filterAtom.reportRead();
    return super._filter;
  }

  @override
  set _filter(Filter value) {
    _$_filterAtom.reportWrite(value, super._filter, () {
      super._filter = value;
    });
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
