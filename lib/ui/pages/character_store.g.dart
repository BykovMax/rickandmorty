// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on CharacterStoreBase, Store {
  Computed<LoadingState>? _$stateComputed;

  @override
  LoadingState get state =>
      (_$stateComputed ??= Computed<LoadingState>(() => super.state,
              name: 'CharacterStoreBase.state'))
          .value;

  late final _$_stateAtom =
      Atom(name: 'CharacterStoreBase._state', context: context);

  @override
  LoadingState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(LoadingState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$CharacterStoreBaseActionController =
      ActionController(name: 'CharacterStoreBase', context: context);

  @override
  void addToFavorites() {
    final _$actionInfo = _$CharacterStoreBaseActionController.startAction(
        name: 'CharacterStoreBase.addToFavorites');
    try {
      return super.addToFavorites();
    } finally {
      _$CharacterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromFavorites() {
    final _$actionInfo = _$CharacterStoreBaseActionController.startAction(
        name: 'CharacterStoreBase.removeFromFavorites');
    try {
      return super.removeFromFavorites();
    } finally {
      _$CharacterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
