import 'package:egymation/core/error/exceptions.dart';
import 'package:egymation/core/network/dio_helper.dart';
import 'package:egymation/core/utils/constants.dart';
import 'package:egymation/features/anime/data/data_source/remote/remote_anime_data_source.dart';
import 'package:egymation/features/anime/data/model/anime_model.dart';
import 'package:egymation/features/anime/domain/entity/anime.dart';

class RemoteAnimeDataSourceImpl extends RemoteAnimeDataSource {
  @override
  Future<Anime> getAnimeGenreByID(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Anime>> getPopularAnime() async {
    final response = await DioHelper.getData(url: Constants.GET_ANIMES_EP);
    if(response.statusCode == 200){
      return List<Anime>.from(
          (response.data as List).map((e) =>
              AnimeModel.fromJson(e)));
    }else{
      throw const ServerException();
    }
  }
  
}