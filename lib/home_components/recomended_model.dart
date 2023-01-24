







class RecomendedMoviesModel{

  final int id;
  final String title;
  final String backDropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;


  const RecomendedMoviesModel   ({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate});


  factory RecomendedMoviesModel.fromJson(Map<String , dynamic> json) => RecomendedMoviesModel(
    id:json["id"],
    title:json["title"],
    backDropPath:json["backdrop_path"],
    overview:json["overview"],
    voteAverage:json["vote_average"].toDouble(),
    releaseDate:json["release_date"],
  );
}