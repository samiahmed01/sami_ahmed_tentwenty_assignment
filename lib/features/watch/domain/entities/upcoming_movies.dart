import '../../data/models/upcoming_movies_model.dart' as umm;

class UpcomingMovies {
  UpcomingMovies({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final Dates? dates;
  final int? page;
  final List<Result> results;
  final int? totalPages;
  final int? totalResults;

  factory UpcomingMovies.fromModel(umm.UpcomingMoviesModel model) {
    return UpcomingMovies(
      dates: model.dates != null ? Dates.fromModel(model.dates!) : null,
      page: model.page,
      results: model.results.map((r) => Result.fromModel(r)).toList(),
      totalPages: model.totalPages,
      totalResults: model.totalResults,
    );
  }
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  final DateTime? maximum;
  final DateTime? minimum;

  factory Dates.fromModel(umm.Dates model) {
    return Dates(
      maximum: model.maximum,
      minimum: model.minimum,
    );
  }
}

class Result {
  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory Result.fromModel(umm.Result model) {
    return Result(
      adult: model.adult,
      backdropPath: model.backdropPath,
      genreIds: List<int>.from(model.genreIds),
      id: model.id,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate,
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}
