import 'package:egymation/features/anime/data/data_source/remote/remote_anime_data_source.dart';
import 'package:egymation/features/anime/data/data_source/remote/remote_anime_data_source_impl.dart';
import 'package:egymation/features/anime/data/repository/anime_repository_impl.dart';
import 'package:egymation/features/anime/domain/repository/anime_repository.dart';
import 'package:egymation/features/anime/domain/use_case/get_all_anime_use_case.dart';
import 'package:egymation/features/anime/presentation/controller/anime_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Data Source ///
    getIt.registerLazySingleton<RemoteAnimeDataSource>(
            () => RemoteAnimeDataSourceImpl());

    /// Repository ///
    getIt.registerLazySingleton<AnimeRepository>(
            () => AnimeRepositoryImpl(remoteAnimeDataSource: getIt()));

    /// UseCases ///
    getIt.registerLazySingleton(
            () => GetAllAnimeUseCase(animeRepository: getIt()));

    /// BLoC ///
    getIt.registerFactory(
            () => AnimeBloc(getAllAnimeUseCase: getIt()));
  }
}
