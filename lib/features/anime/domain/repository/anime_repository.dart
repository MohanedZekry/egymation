import 'package:dartz/dartz.dart';
import 'package:egymation/core/error/failure.dart';
import 'package:egymation/features/anime/domain/entity/anime.dart';

abstract class AnimeRepository {
  Future<Either<Failure,List<Anime>>> getPopularAnime();
  Future<Either<Failure,Anime>> getAnimeGenreByID(String id);
}
