import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_items.freezed.dart';

enum CharacterSpecies {
  human("Human"),
  alien("Alien"),
  empty("");

  const CharacterSpecies(this.value);

  final String value;
}

enum CharacterStatus {
  alive("Alive"),
  dead("Dead"),
  empty("");

  const CharacterStatus(this.value);

  final String value;
}

enum CharacterGender {
  female("Female"),
  male("Male"),
  unknown("unknown"),
  empty("");

  const CharacterGender(this.value);

  final String value;
}

@freezed
class Filter with _$Filter {
  const factory Filter(
    String query,
    CharacterSpecies species,
    CharacterStatus status,
    CharacterGender gender,
  ) = _Filter;

  factory Filter.empty() => const Filter(
        '',
        CharacterSpecies.empty,
        CharacterStatus.empty,
        CharacterGender.empty,
      );
}
