import 'package:go_router/go_router.dart';

import '../features/dashboard/presentation/dashboard_screen.dart';
import '../features/watch/domain/entities/movie_detail.dart';
import '../features/watch/presentation/get_tickets_screen.dart';
import '../features/watch/presentation/movie_detail_screen.dart';
import '../features/watch/presentation/select_seat_screen.dart';
import '../features/watch/presentation/video_player_screen.dart';

part 'app_routes.dart';


class AppPages {
  AppPages._();

  static final GoRouter routers = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: Routes.dashboard,
          path: '/',
          builder: (context, state) => DashboardScreen(),
        ),
        GoRoute(
            name: Routes.movieDetail,
            path: Routes.movieDetail,
            builder: (context, state){
              final data = state.extra! as int;
              return MovieDetailScreen(movieId: data,);
            }
        ),
        GoRoute(
            name: Routes.videoPlayer,
            path: Routes.videoPlayer,
            builder: (context, state){
              final data = state.extra! as List<Result>;
              return VideoPlayerScreen(videoList: data,);
            }
        ),
        GoRoute(
          name: Routes.getTickets,
          path: '${Routes.getTickets}/:movieName/:releaseDate',
          builder: (context, state) =>  GetTicketsScreen(
            movieName: state.pathParameters['movieName'],
            releaseDate: state.pathParameters['releaseDate'],
          ),
        ),
        GoRoute(
          name: Routes.selectSeat,
          path: '${Routes.selectSeat}/:movieName/:date/:hallLocation',
          builder: (context, state) =>  SelectSeatScreen(
            movieName: state.pathParameters['movieName'],
            date: state.pathParameters['date'],
            hallLocation: state.pathParameters['hallLocation'],
          ),
        ),
      ],
  );
}
