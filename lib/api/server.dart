import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'models/character.dart';
import 'models/page.dart';

part 'server.g.dart';
@singleton
@RestApi()
abstract class RestClient {
  @FactoryMethod()
  factory RestClient(Dio dio) = _RestClient;

  @GET("/api/character/")
  Future<Page<Character>> characters();

  @GET("/api/character/{id}")
  Future<Character> character(@Path("id") String id);
}
