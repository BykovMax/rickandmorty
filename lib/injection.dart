import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:server/injection.dart' as server;

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
  server.configureDependencies(getIt);
}
