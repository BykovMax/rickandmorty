import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmorty/api/models/character.dart';
import 'package:rickandmorty/api/models/info.dart';

part 'page.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Page<T> {
  Info info;
  List<T> results;

  Page(this.results, this.info);

  factory Page.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PageFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) => _$PageToJson<T>(this, toJsonT);
}
