import 'package:equatable/equatable.dart';

class Anime extends Equatable {

  final String id;
  final String title;
  final String imagePath;
  final double ratings;
  final String backgroundPath;
  final String description;

  const Anime({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.ratings,
    required this.backgroundPath,
    required this.description,
  });

  @override
  List<Object> get props => [id, title, imagePath, ratings,backgroundPath,description];

}