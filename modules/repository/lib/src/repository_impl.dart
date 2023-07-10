import 'package:injectable/injectable.dart';
import 'package:repository/src/repository.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

@Injectable(as: Repository)
class RepositoryImpl implements Repository {
  final rxPrefs = RxSharedPreferences.getInstance();

  String _favoriteKey(String id) => 'favorite_$id';

  @override
  Stream<bool> isFavourite(String id) {
    return rxPrefs.getBoolStream(_favoriteKey(id)).map((event) => event ?? false);
  }

  @override
  Future<void> markFavourite(String id) => _markFavourite(id, true);

  @override
  Future<void> markUnFavourite(String id) => _markFavourite(id, false);

  Future<void> _markFavourite(String id, bool isFavorite) =>
      rxPrefs.setBool(_favoriteKey(id), isFavorite);
}
