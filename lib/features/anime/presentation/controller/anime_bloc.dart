import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:egymation/core/use_case/base_use_case.dart';
import 'package:egymation/core/utils/enums_state.dart';
import 'package:egymation/features/anime/domain/use_case/get_all_anime_use_case.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entity/anime.dart';
part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {

  GetAllAnimeUseCase getAllAnimeUseCase;

  AnimeBloc({required this.getAllAnimeUseCase})
      : super(const AnimeState()) {
      on<GetAllAnimeEvent>(_getAllAnime);
      on<ChangeIndicatorEvent>(_changeIndicatorIndex);
  }

  FutureOr<void> _getAllAnime(GetAllAnimeEvent event, Emitter<AnimeState> emit) async {
    final result = await getAllAnimeUseCase(const NoParams());
    result.fold(
            (l) => emit(state.copyWith(
            requestState:  RequestState.error
        )),
            (r) => emit(state.copyWith(
            animeList: r,
            requestState: RequestState.loaded
        )));
  }

  FutureOr<void> _changeIndicatorIndex(ChangeIndicatorEvent event, Emitter<AnimeState> emit) {
      emit(state.copyWith(
        index: event.index
      ));

  }
}
