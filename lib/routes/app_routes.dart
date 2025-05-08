part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const dashboard = _Paths.dashboard;
  static const movieDetail = _Paths.movieDetail;
  static const videoPlayer = _Paths.videoPlayer;
  static const getTickets = _Paths.getTickets;
  static const selectSeat = _Paths.selectSeat;

}

abstract class _Paths {
  static const dashboard = '/dashboard';
  static const movieDetail = '/movieDetail';
  static const videoPlayer = '/videoPlayer';
  static const getTickets = '/getTickets';
  static const selectSeat = '/selectSeat';

}