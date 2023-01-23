

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_application/home_components/home_model.dart';

class FetchData{

  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String apiKey = "2618ec0ea1cf82decc08f94d2be8f6a5";

   String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";


  static String imageUrl(String path) => "$baseImageUrl$path";

  Future<List<HomeMoviesModel>> fetchData() async{
    final respone = await Dio().get(nowPlayingMoviesPath);

    if (respone.statusCode == 200) {
      return List<HomeMoviesModel>.from(
          (respone.data["results"] ?? [] as List).map((e) => HomeMoviesModel.fromJson(e)));
    } else {
      throw Text("Sorry");
    }

  }


}