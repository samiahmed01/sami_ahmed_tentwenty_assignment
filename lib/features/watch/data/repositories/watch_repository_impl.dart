import 'package:dartz/dartz.dart';

import 'package:sami_ahmed_tentwenty_assignment/core/utils/error_handler/failures.dart';
import 'package:sami_ahmed_tentwenty_assignment/features/watch/domain/entities/movie_detail.dart' as md;

import 'package:sami_ahmed_tentwenty_assignment/features/watch/domain/entities/upcoming_movies.dart' as um;

import '../../../../core/utils/error_handler/exceptions.dart';
import '../../../../services/dependency_injection/service_locator.dart';
import '../../domain/repositories/watch_repository.dart';
import '../datasources/watch_remote_data_source.dart';

class WatchRepositoryImpl implements WatchRepository {

  @override
  Future<Either<Failure, um.UpcomingMovies>> getUpcomingMovies() async {
    try {
      final movieModels = await sl<WatchRemoteDataSource>().getUpcomingMovies();
      final movies = um.UpcomingMovies.fromModel(movieModels);
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, md.MovieDetail>> getMovieDetail(movieId) async {
    try {
      final model = await sl<WatchRemoteDataSource>().getMovieDetail(movieId);
      final movie = md.MovieDetail.fromModel(model);
      return Right(movie);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}