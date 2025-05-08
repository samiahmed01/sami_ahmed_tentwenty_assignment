import 'package:dartz/dartz.dart';

import '../../../../core/utils/error_handler/failures.dart';
import '../../../../services/dependency_injection/service_locator.dart';
import '../entities/movie_detail.dart';
import '../repositories/watch_repository.dart';

 class GettingMovieDetail {
  Future<Either<Failure, MovieDetail>> call(movieId) async {
    return sl<WatchRepository>().getMovieDetail(movieId);
  }
}