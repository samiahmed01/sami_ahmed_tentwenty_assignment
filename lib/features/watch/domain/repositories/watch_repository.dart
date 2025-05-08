import 'package:dartz/dartz.dart';

import '../../../../core/utils/error_handler/failures.dart';
import '../entities/movie_detail.dart';
import '../entities/upcoming_movies.dart';

abstract class WatchRepository {
  Future<Either<Failure, UpcomingMovies>> getUpcomingMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetail(movieId);
}