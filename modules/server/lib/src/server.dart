import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'models/character.dart';
import 'models/page.dart';

part 'server.g.dart';

@singleton
@RestApi()
abstract class RestClient {
  @FactoryMethod()
  factory RestClient(Dio dio) = _RestClient;

  @GET("/api/character/")
  Future<Page<Character>> searchCharacters(
    @Query("name") String query,
    @Query("species") String species,
    @Query("status") String status,
    @Query("gender") String gender,
  );

  @GET("/api/character/{id}")
  Future<Character> character(@Path("id") String id);
}
