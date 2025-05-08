import 'package:dio/dio.dart';

import '../../../../core/utils/endpoints/end_points.dart';
import '../../../../core/utils/network/dio_client.dart';
import '../../../../services/dependency_injection/service_locator.dart';
import '../models/movie_detail_model.dart';
import '../models/upcoming_movies_model.dart';

abstract class WatchRemoteDataSource {
  Future<UpcomingMoviesModel> getUpcomingMovies();
  Future<MovieDetailModel> getMovieDetail(movieId);
}

class WatchRemoteDataSourceImpl implements WatchRemoteDataSource {

  @override
  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiEndpoints.upcomingMovies,
      );

      return UpcomingMoviesModel.fromJson(response);

    } on DioException catch(e) {
      throw Exception('Failed to load movies $e');
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(movieId) async {
    try {
      var response = await sl<DioClient>().get(
        "${ApiEndpoints.movieDetail}$movieId",
        queryParameters: {
          'append_to_response': 'videos',
        },
      );
      return MovieDetailModel.fromJson(response);

    } on DioException catch(e) {
      throw Exception('Failed to load movies $e');
    }
  }
}