import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sami_ahmed_tentwenty_assignment/features/watch/bloc/watch_event.dart';
import 'package:sami_ahmed_tentwenty_assignment/features/watch/bloc/watch_state.dart';
import 'package:sami_ahmed_tentwenty_assignment/features/watch/domain/usecases/getting_movie_detail.dart';

import '../../../../core/utils/enums/state_type_enum.dart';
import '../../../core/utils/error_handler/failures.dart';
import '../../../services/dependency_injection/service_locator.dart';
import '../domain/usecases/getting_upcoming_movies.dart';

class WatchBloc extends Bloc<WatchEvent, WatchState> {

  WatchBloc() : super(const WatchState()){
    on<GetUpcomingMovies>(_onGetUpcomingMovies);
    on<GetMovieDetail>(_onGetMovieDetail);
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return 'Server Failure';
      default:
        return 'Unexpected Error';
    }
  }

  Future<void> _onGetUpcomingMovies(
      GetUpcomingMovies event,
      Emitter<WatchState> emit,
      ) async {

    emit(state.copyWith(
        stateType: StateType.loading,
        type: "GettingUpcomingMovies"
    )); // Emit loading state

    try {

      var data = await sl<GettingUpcomingMovies>().call();

      data.fold(
            (failure) {
          emit(state.copyWith(
              stateType: StateType.failure,
              message: _mapFailureToMessage(failure),
              type: "GettingUpcomingMovies"
          ));
        },
            (loginResponse) {

          emit(state.copyWith(
              upcomingMovies: loginResponse,
              stateType: StateType.success,
              message: 'Got upcoming movies successfully!',
              type: "GettingUpcomingMovies"
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          stateType: StateType.failure,
          message: 'An error occurred: ${e.toString()}',
          type: "GettingUpcomingMovies"
      ));
    }
  }

  Future<void> _onGetMovieDetail(
      GetMovieDetail event,
      Emitter<WatchState> emit,
      ) async {

    emit(state.copyWith(
        stateType: StateType.loading,
        type: "GettingMovieDetail"
    )); // Emit loading state

    try {

      var data = await sl<GettingMovieDetail>().call(event.movieId);

      data.fold(
            (failure) {
          emit(state.copyWith(
              stateType: StateType.failure,
              message: _mapFailureToMessage(failure),
              type: "GettingMovieDetail"
          ));
        },
            (loginResponse) {

          emit(state.copyWith(
              movieDetail: loginResponse,
              stateType: StateType.success,
              message: 'Got movie detail successfully!',
              type: "GettingMovieDetail"
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          stateType: StateType.failure,
          message: 'An error occurred: ${e.toString()}',
          type: "GettingMovieDetail"
      ));
    }
  }

}