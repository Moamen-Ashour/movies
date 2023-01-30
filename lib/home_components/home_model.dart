

import 'category_model.dart';

class HomeMoviesModel {

  final int id;
  final String title;
  final String backDropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;


  const HomeMoviesModel    ({
     required this.id,
     required this.title,
     required this.backDropPath,
     required this.overview,
     required this.voteAverage,
     required this.releaseDate});


  factory HomeMoviesModel.fromJson(Map<String , dynamic> json) => HomeMoviesModel(
    id:json["id"],
    // genres:List.from(json["genre_ids"].map((x)=>CategoryModel.fromJson(x))),
    title:json["title"],
    backDropPath:json["backdrop_path"],
    overview:json["overview"],
    voteAverage:json["vote_average"].toDouble(),
    releaseDate:json["release_date"],
  );
}