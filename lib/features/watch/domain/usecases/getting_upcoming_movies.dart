import 'package:dartz/dartz.dart';

import '../../../../core/utils/error_handler/failures.dart';
import '../../../../services/dependency_injection/service_locator.dart';
import '../entities/upcoming_movies.dart';
import '../repositories/watch_repository.dart';

 class GettingUpcomingMovies {
  Future<Either<Failure, UpcomingMovies>> call() async {
    return sl<WatchRepository>().getUpcomingMovies();
  }
}