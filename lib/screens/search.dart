import 'dart:collection';
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:dotted_border/dotted_border.dart';
import '../home_components/fetch_data_from_api.dart';
import '../home_components/home_model.dart';
import '../search_components/search_text_field.dart';
import '../utils/app_colors.dart';
import 'movie_details.dart';

class Search extends StatefulWidget {

  // ToDo : problem with bottom size should fix it

  static const String routeName = "search";

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var controller = TextEditingController();

  String query = "";

  List<HomeMoviesModel> movies = [];

  double rating = 0;
  @override
  Widget build(BuildContext context) {

    FetchData fetchData = FetchData();
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: controller,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_cGrTnWbTHx.json",width: 20,height: 20),
                fillColor: Color(0xff5A5A5A),
                hintText: "search on our movies",
                hintStyle: TextStyle(
                    color: Colors.white
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 3, color: Colors.white),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                ),
              ),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: fetchData.searchMovies(query),
                  builder: (context, snapshot) {
                    List<HomeMoviesModel>? movie = snapshot.data;
                    if (snapshot.data == null){
                      return Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMIfs8LQQEjV7-fpViosJK72EE-S9GWbAWvi6HHv90NVfUdKSM6M86E0nzAYCE97QZGow&usqp=CAU",width: 150,);
                    }else if(snapshot.data == ConnectionState.waiting) {
                      return Center(child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_j1adxtyb.json",),);
                    }else if(snapshot.hasError){
                      return Center(child: Text("Something went wrong with popular api",style: TextStyle(color: Colors.red,fontSize: 30),));
                    }else{
                      return FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            final movie2 = snapshot.data?[index];
                            // String date = DateFormat('yyyy-MM-dd').format(movie2!.releaseDate);
                            return InkWell(

                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Movie_Details(movieId: movie2.id)
                                )
                                );
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                // decoration: BoxDecoration(
                                //   border: Border.all(width: 0, color: Colors.white),
                                //   borderRadius: BorderRadius.all(Radius.circular(30)),
                                // ),
                                child: Column(
                                children: [
                                   Expanded(
                                     child: Row(
                                       children: [
                                         DottedBorder(
                                           borderType: BorderType.RRect,
                                           radius: Radius.circular(10),
                                           // padding: EdgeInsets.all(6),
                                           dashPattern: [6, 3, 2, 3],
                                           strokeWidth: 2,
                                           color: Colors.white,
                                           child: Container(
                                             height: 150,
                                             width: 120,
                                             // decoration: BoxDecoration(
                                             //   border: Border.all(width: 2, color: Colors.white70),
                                             //   borderRadius: BorderRadius.circular(10),
                                             // ),
                                             child:  Image.network(fetchData.imageUrl(movie2!.backDropPath),fit: BoxFit.cover,),
                                           ),
                                         ),
                                         Expanded(
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Text(
                                                 movie2!.title,
                                                 // textAlign: TextAlign.justify,
                                                 style: TextStyle(
                                                   fontSize: 11,
                                                   color: Colors.white,
                                                   fontWeight: FontWeight.bold,
                                                 ), //Textstyle
                                               ),
                                               Spacer(),
                                               Text(
                                                 // date,
                                                  movie2.releaseDate.split('-')[0],
                                                 textAlign: TextAlign.justify,
                                                 style: TextStyle(
                                                   fontSize: 11,
                                                   color: Colors.white,
                                                   fontWeight: FontWeight.w500,
                                                 ), //Textstyle
                                               ),
                                               Spacer(),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children:  [
                                                   RatingBar.builder(
                                                     initialRating: stars(movie2.voteAverage),
                                                     // minRating: movie2.voteAverage<5?4:movie2.voteAverage,
                                                     unratedColor: Colors.grey,
                                                     itemCount: 8,
                                                     itemSize: 15,
                                                     itemBuilder: (context,_) => Icon(Icons.star,color: Colors.amber,size: 5,),
                                                     onRatingUpdate: (rating) => setState(() {
                                                      rating = movie2.voteAverage;
                                                      this.rating = rating;
                                                     },
                                                     ),
                                                   ),

                                                   // Text.rich(
                                                   //   TextSpan(
                                                   //     style: TextStyle(
                                                   //       fontSize: 5,
                                                   //       color: Colors.white
                                                   //     ),
                                                   //     children: [
                                                   //       // WidgetSpan(
                                                   //       //   child: Row(
                                                   //       //     children: [
                                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,),
                                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,),
                                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,),
                                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,),
                                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,)
                                                   //       //     ],
                                                   //       //   ),
                                                   //       // ),
                                                   //       TextSpan(
                                                   //         text: "${movie2.voteAverage}",
                                                   //       )
                                                   //     ],
                                                   //   ),
                                                   // ),
                                                   // Icon(Icons.star,color: Colors.yellowAccent,),
                                                   // SizedBox(width: 3,),
                                                   // Text(
                                                   //   // date,
                                                   //   "${movie2.voteAverage}",
                                                   //   textAlign: TextAlign.justify,
                                                   //   style: TextStyle(
                                                   //     fontSize: 10,
                                                   //     color: Colors.white,
                                                   //     fontWeight: FontWeight.w500,
                                                   //   ), //Textstyle
                                                   // ),
                                                 ],
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.white,
                                  ),
                                ]
                                      )
                            )
                            );
                          
                            },
                        ),
                      );
                    }
                        }
              )
          )

        ],
      ),
    );
  }

  double stars(double rating){

if(rating<=8&&rating>7.5){
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


  //
  // void searchMovie(String query) {
  //   var suggestions = movies.where((element) {
  //     final movieTitle = element.title.toLowerCase();
  //     final input = query.toLowerCase();
  //
  //     return movieTitle.contains(input);
  //   }).toList();
  //
  // setState(() {
  //   movies = suggestions;
  // });
  }
