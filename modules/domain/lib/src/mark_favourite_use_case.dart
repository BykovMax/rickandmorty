import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:repository/repository.dart';

@injectable
class MarkFavouriteUseCase {
  final Repository _repository = GetIt.instance.get();

  Future<void> markFavourite(String id) => _repository.markFavourite(id);
}
