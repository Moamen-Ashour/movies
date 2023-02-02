import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/movie_details_components/movie_details_model.dart';
import 'package:movie_application/utils/app_colors.dart';
import 'package:video_player/video_player.dart';

import '../home_components/category_model.dart';
import '../home_components/fetch_data_from_api.dart';
import '../home_components/recomended_movies_component.dart';
import '../layout/container.dart';
import '../movie_details_components/film_type_border.dart';
import '../movie_details_components/like_this_component.dart';
import '../movie_details_components/movie_details_model.dart';
import '../movie_details_components/movie_details_model.dart';
import '../movie_details_components/movie_details_model.dart';
import '../movie_details_components/movie_details_model.dart';
import '../movie_details_components/movie_details_model.dart';
import '../movie_details_components/poster_component.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../movie_details_components/poster_like_this_component.dart';
import '../other_components/recomended_component/recomended_component.dart';

class Movie_Details extends StatefulWidget {
  static const String routeName = "movieDetails";

  final vieoUrl = "https://www.youtube.com/watch?v=cqGjhVJWtEg";



  final int movieId;

  Movie_Details({required this.movieId});

  @override
  State<Movie_Details> createState() => _Movie_DetailsState();
}

class _Movie_DetailsState extends State<Movie_Details> {


  bool  isPressed = true;

  var fetchData = FetchData();



  double rating = 0;


  @override
  Widget build(BuildContext context) {

  print(widget.movieId);
    return  FutureBuilder(
        future: fetchData.getMovieDetails(widget.movieId),
        builder: (context,snapshot) {
          MoviesDetailModel? movie = snapshot.data;
          if (snapshot.data == null ||
              snapshot.data == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("Something went wrong with now playing api",style: TextStyle(color: Colors.red,fontSize: 30),));
          }
          else {
            return   Scaffold(
              backgroundColor: AppColors.BGColor,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("${movie?.title}"),
              ),
              body: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Film smail
                  Stack(
                    children: [
                      CachedNetworkImage(
                        height: 150.0,
                        width: double.infinity,
                        imageUrl: fetchData.imageUrl(movie!.backdropPath),
                        fit: BoxFit.fill,

                      ),
                      //Image.asset('assets/images/play-button.png',),
                    ],
                  ),
                  //Drop and the lost
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${movie.title}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        //2019 PG-13 2h 7m
                        Text(
                          "${movie.releaseDate}",
                          style: TextStyle(
                              color: Color.fromRGBO(182, 181, 181, 1.0), fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Action
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        // height: ,
                      ),
                      PosterComponent(movie.title,movie.id,isPressed,fetchData.imageUrl(movie!.backdropPath),movie.overView),
                      //Action
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FilmTypeBorder("${getTextElement(showGenres(movie.genres)).toString().replaceAll('{', '').replaceAll('}', '')}"),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                FilmTypeBorder("${getTextElement(showGenres(movie.genres)).toString().replaceAll('{', '').replaceAll('}', '')}"),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                FilmTypeBorder("${getTextElement(showGenres(movie.genres)).toString().replaceAll('{', '').replaceAll('}', '')}")
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Text(
                                    "${movie.overView}"
                                    ,textAlign: TextAlign.justify,
                                    style: TextStyle(color: Colors.grey, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //Star Picture
                                Container(
                                  //width: 20,
                                  child:  RatingBar.builder(
                                    initialRating: stars(movie.voteAverage),
                                    // minRating: movie2.voteAverage<5?4:movie2.voteAverage,
                                    unratedColor: Colors.grey,
                                    itemCount: 8,
                                    itemSize: 15,
                                    itemBuilder: (context,_) => Icon(Icons.star,color: Colors.amber,size: 5,),
                                    onRatingUpdate: (rating) => setState(() {
                                      rating = movie.voteAverage;
                                      this.rating = rating;
                                    },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${movie.voteAverage.toStringAsFixed(1)}',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "More Like This",
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) => RecomendedScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: seeMore('See More '),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RecomendedMoviesComponent(),
                ],
              ),
            );
          }
        }
    );
  }


  Row seeMore(String word){
    return  Row(
      children:  [
        Text(word,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
          color: Colors.white,
        )
      ],
    );
  }

  Set<String?> showGenres(List<CategoryModel> genres) {
    String result = '';
    Set<String> names ={};
    final seen = Set<CategoryModel>();
    final unique = genres.where((str) => seen.add(str)).toList();
    for (int i = 0;i<unique.length;i++) {
      names.add(unique[i].name);
    }

    // print(names);
    // result = .;
    names.toString().replaceAll('{', '').replaceAll('}', '');
    names.join(", ");
    return names;
  }


  String? getTextElement(Set<String?> list) {
    return list.firstWhere((e) => e is String);
  }

  double stars(double rating){
    if(rating > 8){
      rating = 8;
    }
    else if(rating<=8&&rating>7.5){
      rating = 7.5;
    }else if(rating<=7.4&&rating>7){
      rating = 7;
    }else if(rating<=7&&rating>6.5){
      rating = 6.5;
    }
    else if(rating<=6.4&&rating>6){
      rating = 6;
    }else if(rating<=6&&rating>5.5){
      rating = 5.5;
    }else if(rating<=5.4&&rating>5){
      rating = 5;
    }else{
      rating =4;
    }
    return rating;
  }
}

