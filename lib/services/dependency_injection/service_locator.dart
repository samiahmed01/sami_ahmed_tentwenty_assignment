import 'package:get_it/get_it.dart';

import '../../core/utils/network/dio_client.dart';
import '../../features/watch/data/datasources/watch_remote_data_source.dart';
import '../../features/watch/data/repositories/watch_repository_impl.dart';
import '../../features/watch/domain/repositories/watch_repository.dart';
import '../../features/watch/domain/usecases/getting_movie_detail.dart';
import '../../features/watch/domain/usecases/getting_upcoming_movies.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient('https://api.themoviedb.org/3'));

  /// Services
  sl.registerSingleton<WatchRemoteDataSource>(WatchRemoteDataSourceImpl());

  /// Repositories
  sl.registerSingleton<WatchRepository>(WatchRepositoryImpl());

  /// Use Cases
  sl.registerSingleton<GettingUpcomingMovies>(GettingUpcomingMovies());
  sl.registerSingleton<GettingMovieDetail>(GettingMovieDetail());

}