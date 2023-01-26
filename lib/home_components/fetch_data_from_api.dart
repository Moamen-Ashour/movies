

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_application/home_components/home_model.dart';
import 'package:movie_application/home_components/popular_model.dart';
import 'package:movie_application/home_components/recomended_model.dart';

class FetchData{

  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "2618ec0ea1cf82decc08f94d2be8f6a5";

  // static const String query = "";

   String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  String newReleaseMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  String recomendedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

   String baseImageUrl = "https://image.tmdb.org/t/p/w500";


   String imageUrl(String path) => "$baseImageUrl$path";

  Future<List<HomeMoviesModel>> fetchData() async {

    final respone = await Dio().get(nowPlayingMoviesPath);

    if (respone.statusCode == 200) {
      return List<HomeMoviesModel>.from(
          (respone.data["results"] ?? [] as List).map((e) => HomeMoviesModel.fromJson(e)));
    } else {
      throw Text("Sorry");
    }
  }


  Future<List<HomeMoviesModel>> searchMovies(String query) async {

    String searchMoviesPath =
        "$baseUrl/search/movie?api_key=$apiKey&query=$query";

    final respone = await Dio().get(searchMoviesPath);
    if (respone.statusCode == 200) {
      return List<HomeMoviesModel>.from(
          (respone.data["results"] ?? [] as List).map((e) => HomeMoviesModel.fromJson(e)));

    } else {
      throw Text("Sorry");
    }


  }

  Future<List<NewReleaseMoviesModel>> fetchNewReleaseMoviesData() async{
    final respone = await Dio().get(newReleaseMoviesPath);

    if (respone.statusCode == 200) {
      return List<NewReleaseMoviesModel>.from(
          (respone.data["results"] ?? [] as List).map((e) => NewReleaseMoviesModel.fromJson(e)));
    } else {
      throw Text("Sorry");
    }

  }


  Future<List<RecomendedMoviesModel>> fetchRecomendedMoviesData() async{
    final respone = await Dio().get(recomendedMoviesPath);

    if (respone.statusCode == 200) {
      return List<RecomendedMoviesModel>.from(
          (respone.data["results"] ?? [] as List).map((e) => RecomendedMoviesModel.fromJson(e)));
    } else {
      throw Text("Sorry");
    }

  }


}