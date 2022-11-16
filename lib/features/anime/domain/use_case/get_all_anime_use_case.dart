import 'package:dartz/dartz.dart';
import 'package:egymation/core/error/failure.dart';
import 'package:egymation/core/use_case/base_use_case.dart';
import 'package:egymation/features/anime/domain/entity/anime.dart';
import 'package:egymation/features/anime/domain/repository/anime_repository.dart';

class GetAllAnimeUseCase extends BaseUseCase<List<Anime>, NoParams>{

  final AnimeRepository animeRepository;

  GetAllAnimeUseCase({required this.animeRepository});

  @override
  Future<Either<Failure, List<Anime>>> call(NoParams params) async {
    return await animeRepository.getPopularAnime();
  }

}