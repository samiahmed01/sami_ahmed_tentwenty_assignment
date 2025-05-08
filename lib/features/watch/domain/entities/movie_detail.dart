import '../../data/models/movie_detail_model.dart' as mdm;

class MovieDetail {
  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.videos,
  });

  final bool? adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genre> genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final Videos? videos;

  factory MovieDetail.fromModel(mdm.MovieDetailModel model) {
    return MovieDetail(
      adult: model.adult,
      backdropPath: model.backdropPath,
      belongsToCollection: model.belongsToCollection != null
          ? BelongsToCollection.fromModel(model.belongsToCollection!)
          : null,
      budget: model.budget,
      genres: model.genres.map((g) => Genre.fromModel(g)).toList(),
      homepage: model.homepage,
      id: model.id,
      imdbId: model.imdbId,
      originCountry: List<String>.from(model.originCountry),
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      productionCompanies:
      model.productionCompanies.map((c) => ProductionCompany.fromModel(c)).toList(),
      productionCountries:
      model.productionCountries.map((c) => ProductionCountry.fromModel(c)).toList(),
      releaseDate: model.releaseDate,
      revenue: model.revenue,
      runtime: model.runtime,
      spokenLanguages:
      model.spokenLanguages.map((s) => SpokenLanguage.fromModel(s)).toList(),
      status: model.status,
      tagline: model.tagline,
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      videos: model.videos != null ? Videos.fromModel(model.videos!) : null,
    );
  }
}

class BelongsToCollection {
  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  factory BelongsToCollection.fromModel(mdm.BelongsToCollection model) {
    return BelongsToCollection(
      id: model.id,
      name: model.name,
      posterPath: model.posterPath,
      backdropPath: model.backdropPath,
    );
  }
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory Genre.fromModel(mdm.Genre model) {
    return Genre(
      id: model.id,
      name: model.name,
    );
  }
}

class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  factory ProductionCompany.fromModel(mdm.ProductionCompany model) {
    return ProductionCompany(
      id: model.id,
      logoPath: model.logoPath,
      name: model.name,
      originCountry: model.originCountry,
    );
  }
}

class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String? iso31661;
  final String? name;

  factory ProductionCountry.fromModel(mdm.ProductionCountry model) {
    return ProductionCountry(
      iso31661: model.iso31661,
      name: model.name,
    );
  }
}

class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String? englishName;
  final String? iso6391;
  final String? name;

  factory SpokenLanguage.fromModel(mdm.SpokenLanguage model) {
    return SpokenLanguage(
      englishName: model.englishName,
      iso6391: model.iso6391,
      name: model.name,
    );
  }
}

class Videos {
  Videos({
    required this.results,
  });

  final List<Result> results;

  factory Videos.fromModel(mdm.Videos model) {
    return Videos(
      results: model.results.map((r) => Result.fromModel(r)).toList(),
    );
  }
}

class Result {
  Result({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  factory Result.fromModel(mdm.Result model) {
    return Result(
      iso6391: model.iso6391,
      iso31661: model.iso31661,
      name: model.name,
      key: model.key,
      site: model.site,
      size: model.size,
      type: model.type,
      official: model.official,
      publishedAt: model.publishedAt,
      id: model.id,
    );
  }
}
