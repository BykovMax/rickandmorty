// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterStore on CharacterStoreBase, Store {
  Computed<LoadingState>? _$loadingComputed;

  @override
  LoadingState get loading =>
      (_$loadingComputed ??= Computed<LoadingState>(() => super.loading,
              name: 'CharacterStoreBase.loading'))
          .value;

  late final _$_loadingAtom =
      Atom(name: 'CharacterStoreBase._loading', context: context);

  @override
  LoadingState get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(LoadingState value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
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
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
