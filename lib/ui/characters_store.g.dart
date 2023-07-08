// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on CharactersStoreBase, Store {
  Computed<List<Character>>? _$itemsComputed;

  @override
  List<Character> get items =>
      (_$itemsComputed ??= Computed<List<Character>>(() => super.items,
              name: 'CharactersStoreBase.items'))
          .value;

  late final _$_itemsAtom =
      Atom(name: 'CharactersStoreBase._items', context: context);

  @override
  List<Character> get _items {
    _$_itemsAtom.reportRead();
    return super._items;
  }

  @override
  set _items(List<Character> value) {
    _$_itemsAtom.reportWrite(value, super._items, () {
      super._items = value;
    });
  }

  late final _$CharactersStoreBaseActionController =
      ActionController(name: 'CharactersStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$CharactersStoreBaseActionController.startAction(
        name: 'CharactersStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$CharactersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
