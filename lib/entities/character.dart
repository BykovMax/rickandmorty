import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
class Character with _$Character {
  const factory Character(int id, String name, String species, String status, String image) =
      _Character;

  factory Character.demo(int item) {
    return Character(item, 'Name $item', 'Species $item', 'Status $item',
        'https://rickandmortyapi.com/api/character/avatar/$item.jpeg');
  }
}
