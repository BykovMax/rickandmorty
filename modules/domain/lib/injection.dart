import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/injection.dart' as repository;
import 'package:server/injection.dart' as server;

import 'injection.config.dart';

@InjectableInit()
void configureDependencies(GetIt instance) {
  instance.init();
  server.configureDependencies(instance);
  repository.configureDependencies(instance);
}
