import '../../domain/entity/anime.dart';

class AnimeModel extends Anime {

  const AnimeModel({
    required super.id,
    required super.title,
    required super.imagePath,
    required super.ratings,
    required super.backgroundPath,
    required super.description
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json)
   => AnimeModel(
       id: json['animeID'],
       title: json['title'],
       imagePath: json['imagePath'],
       ratings: json['ratings'],
       backgroundPath :json['backgroundPath'],
       description: json['description'],
   );
}