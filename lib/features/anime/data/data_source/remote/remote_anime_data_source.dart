import '../../../domain/entity/anime.dart';

abstract class RemoteAnimeDataSource {
  Future<List<Anime>> getPopularAnime();
  Future<Anime> getAnimeGenreByID(String id);
}