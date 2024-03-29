import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ServerModule {
  @Named("BaseUrl")
  String get baseUrl => "https://rickandmortyapi.com";

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}
