import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';


@JsonSerializable()
class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? image;

  Character({this.id, this.name, this.status, this.species, this.image});

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
