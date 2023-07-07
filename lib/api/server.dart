import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'models/character.dart';
import 'models/page.dart';

part 'server.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/character/")
  Future<Page<Character>> characters();

  @GET("/api/character/{id}")
  Future<Character> character(@Path("id") String id);
}
