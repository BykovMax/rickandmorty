abstract class Repository {
  Stream<bool> isFavourite(String id);

  Future<void> markFavourite(String id);

  Future<void> markUnFavourite(String id);
}
