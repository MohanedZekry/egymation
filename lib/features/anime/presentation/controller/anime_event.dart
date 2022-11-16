part of 'anime_bloc.dart';

abstract class AnimeEvent extends Equatable {
  const AnimeEvent();

  @override
  List<Object> get props => [];
}

class GetAllAnimeEvent extends AnimeEvent {}

class ChangeIndicatorEvent extends AnimeEvent {
  final int index;

  const ChangeIndicatorEvent({required this.index});

  @override
  List<Object> get props => [index];
}