// // To parse this JSON data, do
// //
// //     final movieModel = movieModelFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));
//
// String movieModelToJson(MovieModel data) => json.encode(data.toJson());
//
// class MovieModel {
//   int page;
//   List<Result> results;
//   int totalPages;
//   int totalResults;
//
//   MovieModel({
//     required this.page,
//     required this.results,
//     required this.totalPages,
//     required this.totalResults,
//   });
//
//   factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
//     page: json["page"],
//     results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     totalPages: json["total_pages"],
//     totalResults: json["total_results"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "page": page,
//     "results": List<dynamic>.from(results.map((x) => x.toJson())),
//     "total_pages": totalPages,
//     "total_results": totalResults,
//   };
// }
//
// class Result {
//   bool adult;
//   String backdropPath;
//   List<int> genreIds;
//   int id;
//   OriginalLanguage originalLanguage;
//   String originalTitle;
//   String overview;
//   double popularity;
//   String posterPath;
//   DateTime releaseDate;
//   String title;
//   bool video;
//   double voteAverage;
//   int voteCount;
//
//   Result({
//     required this.adult,
//     required this.backdropPath,
//     required this.genreIds,
//     required this.id,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.releaseDate,
//     required this.title,
//     required this.video,
//     required this.voteAverage,
//     required this.voteCount,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     adult: json["adult"],
//     backdropPath: json["backdrop_path"],
//     genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//     id: json["id"],
//     originalLanguage: originalLanguageValues.map[json["original_language"]]!,
//     originalTitle: json["original_title"],
//     overview: json["overview"],
//     popularity: json["popularity"]?.toDouble(),
//     posterPath: json["poster_path"],
//     releaseDate: DateTime.parse(json["release_date"]),
//     title: json["title"],
//     video: json["video"],
//     voteAverage: json["vote_average"]?.toDouble(),
//     voteCount: json["vote_count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "adult": adult,
//     "backdrop_path": backdropPath,
//     "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//     "id": id,
//     "original_language": originalLanguageValues.reverse[originalLanguage],
//     "original_title": originalTitle,
//     "overview": overview,
//     "popularity": popularity,
//     "poster_path": posterPath,
//     "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//     "title": title,
//     "video": video,
//     "vote_average": voteAverage,
//     "vote_count": voteCount,
//   };
// }
//
// enum OriginalLanguage {
//   EN,
//   ES
// }
//
// final originalLanguageValues = EnumValues({
//   "en": OriginalLanguage.EN,
//   "es": OriginalLanguage.ES
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
class MovieModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MovieModel({this.page, this.results, this.totalPages, this.totalResults});

  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
