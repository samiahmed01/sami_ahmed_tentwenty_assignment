import 'package:equatable/equatable.dart';
import 'package:sami_ahmed_tentwenty_assignment/features/watch/domain/entities/upcoming_movies.dart';

import '../../../core/utils/enums/state_type_enum.dart';
import '../domain/entities/movie_detail.dart';

class WatchState extends Equatable {

  final StateType? stateType;
  final String? message;
  final String? type;
  final UpcomingMovies? upcomingMovies;
  final MovieDetail? movieDetail;

  const WatchState({this.stateType= StateType.initial, this.message = '' , this.upcomingMovies,this.type = '',this.movieDetail});

  WatchState copyWith({ StateType? stateType, String? message, UpcomingMovies? upcomingMovies,String? type,MovieDetail? movieDetail}) {
    return WatchState(stateType: stateType ?? this.stateType, message: message ?? this.message, upcomingMovies: upcomingMovies ?? this.upcomingMovies,type: type ?? this.type,movieDetail: movieDetail ?? this.movieDetail);
  }

  @override
  List<Object?> get props => [
    stateType,
    message,
    upcomingMovies,
    type,
    movieDetail
  ];
}