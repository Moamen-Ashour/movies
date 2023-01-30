import '../home_components/category_model.dart';

class MoviesDetailModel {
  final String backdropPath;
  final String overView;
  final String releaseDate;
  final String title;
  final double voteAverage;
  // final int runtime;
  final int id;
  final List<CategoryModel> genres;

  MoviesDetailModel({
      required this.backdropPath,
      required this.overView,
      required this.genres,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
     // required  this.runtime,
      required this.id});


  factory MoviesDetailModel.fromJson(Map<String, dynamic>json)=>MoviesDetailModel(
    backdropPath: json["backdrop_path"],
    genres: List<CategoryModel>.from(json["genres"].map((x)=> CategoryModel.fromJson(x))),
    id: json["id"],
    overView:json["overview"],
    voteAverage:json["vote_average"].toDouble(),
    releaseDate:json["release_date"],
    // runtime: json["runtime"],
    title: json["title"],
  );


}