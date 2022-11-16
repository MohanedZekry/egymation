part of 'anime_bloc.dart';

class AnimeState extends Equatable {
  final List<Anime> animeList;
  final RequestState requestState;
  final int index;

  const AnimeState({
    this.animeList = const [],
    this.requestState = RequestState.loading,
    this.index = 0
  });

  @override
  List<Object> get props => [animeList, requestState,index];

  AnimeState copyWith({
    List<Anime>? animeList,
    RequestState? requestState,
    int? index,
  }){
    return AnimeState(
        requestState: requestState ?? this.requestState,
        animeList: animeList ?? this.animeList,
        index: index ?? this.index,
    );
  }
}
