// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page<T> _$PageFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Page<T>(
      (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      Info.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PageToJson<T>(
  Page<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results.map(toJsonT).toList(),
    };
