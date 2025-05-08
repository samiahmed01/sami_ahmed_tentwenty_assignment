abstract class WatchEvent {}

class GetUpcomingMovies extends WatchEvent {}

class GetMovieDetail extends WatchEvent {
  final int movieId;

  GetMovieDetail({
    required this.movieId,
  });
}

