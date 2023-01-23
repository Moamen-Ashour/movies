//
//
// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
//
// import '../models/home_model.dart';
//
// abstract class BaseHomeMovies {
//   Future<List<HomeMoviesModel>> getNowPlaying();
//   Future<List<HomeMoviesModel>> getPopualrMovies();
//   Future<List<HomeMoviesModel>> getTopRatedMovies();
// }
//
// class HomeServices extends BaseHomeMovies{
//
//   static const String baseUrl = "https://api.themoviedb.org/3";
//
//   static const String apiKey = "2618ec0ea1cf82decc08f94d2be8f6a5";
//
//
//   String nowPlayingMoviesPath =
//       "$baseUrl/movie/now_playing?api_key=$apiKey";
//
//    String newReleaseMoviesPath =
//       "$baseUrl/movie/popular?api_key=$apiKey";
//
//    String recomendedMoviesPath =
//       "$baseUrl/movie/top_rated?api_key=$apiKey";
//
//
//   static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
//
//
//   static String imageUrl(String? path) => "$baseImageUrl$path";
//
//   @override
//   Future<List<HomeMoviesModel>> getNowPlaying() async{
//     final respone = await Dio().get(
//         nowPlayingMoviesPath
//     );
//
//     if (respone.statusCode == 200) {
//       return List<HomeMoviesModel>.from(
//           (respone.data["results"] ?? [] as List).map((e) => HomeMoviesModel.fromJson(e)));
//     } else {
//       throw Text("Something went wrong");
//     }
//   }
//
//   @override
//   Future<List<HomeMoviesModel>> getPopualrMovies() async{
//     // TODO: implement getPopualrMovies
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<HomeMoviesModel>> getTopRatedMovies() {
//     // TODO: implement getTopRatedMovies
//     throw UnimplementedError();
//   }
//
//
//
//
//
//
//
// }