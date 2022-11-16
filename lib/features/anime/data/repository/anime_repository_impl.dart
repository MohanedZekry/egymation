import 'package:dartz/dartz.dart';
import 'package:egymation/core/error/exceptions.dart';
import 'package:egymation/core/error/failure.dart';
import 'package:egymation/features/anime/data/data_source/remote/remote_anime_data_source.dart';
import 'package:egymation/features/anime/domain/entity/anime.dart';
import 'package:egymation/features/anime/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl extends AnimeRepository{

  final RemoteAnimeDataSource remoteAnimeDataSource;

  AnimeRepositoryImpl({required this.remoteAnimeDataSource});

  @override
  Future<Either<Failure, List<Anime>>> getPopularAnime() async{
    try {
      final result = await remoteAnimeDataSource.getPopularAnime();
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(message: failure.toString()));
    }
  }

  @override
  Future<Either<Failure, Anime>> getAnimeGenreByID(String id) {
    throw UnimplementedError();
  }
}