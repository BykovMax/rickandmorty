// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Filter {
  String get query => throw _privateConstructorUsedError;
  CharacterSpecies get species => throw _privateConstructorUsedError;
  CharacterStatus get status => throw _privateConstructorUsedError;
  CharacterGender get gender => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterCopyWith<Filter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCopyWith<$Res> {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) then) =
      _$FilterCopyWithImpl<$Res, Filter>;
  @useResult
  $Res call(
      {String query,
      CharacterSpecies species,
      CharacterStatus status,
      CharacterGender gender});
}

/// @nodoc
class _$FilterCopyWithImpl<$Res, $Val extends Filter>
    implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? species = null,
    Object? status = null,
    Object? gender = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as CharacterSpecies,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatus,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as CharacterGender,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$$_FilterCopyWith(_$_Filter value, $Res Function(_$_Filter) then) =
      __$$_FilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      CharacterSpecies species,
      CharacterStatus status,
      CharacterGender gender});
}

/// @nodoc
class __$$_FilterCopyWithImpl<$Res>
    extends _$FilterCopyWithImpl<$Res, _$_Filter>
    implements _$$_FilterCopyWith<$Res> {
  __$$_FilterCopyWithImpl(_$_Filter _value, $Res Function(_$_Filter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? species = null,
    Object? status = null,
    Object? gender = null,
  }) {
    return _then(_$_Filter(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as CharacterSpecies,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CharacterStatus,
      null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as CharacterGender,
    ));
  }
}

/// @nodoc

class _$_Filter implements _Filter {
  const _$_Filter(this.query, this.species, this.status, this.gender);

  @override
  final String query;
  @override
  final CharacterSpecies species;
  @override
  final CharacterStatus status;
  @override
  final CharacterGender gender;

  @override
  String toString() {
    return 'Filter(query: $query, species: $species, status: $status, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Filter &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, species, status, gender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterCopyWith<_$_Filter> get copyWith =>
      __$$_FilterCopyWithImpl<_$_Filter>(this, _$identity);
}

abstract class _Filter implements Filter {
  const factory _Filter(final String query, final CharacterSpecies species,
      final CharacterStatus status, final CharacterGender gender) = _$_Filter;

  @override
  String get query;
  @override
  CharacterSpecies get species;
  @override
  CharacterStatus get status;
  @override
  CharacterGender get gender;
  @override
  @JsonKey(ignore: true)
  _$$_FilterCopyWith<_$_Filter> get copyWith =>
      throw _privateConstructorUsedError;
}
