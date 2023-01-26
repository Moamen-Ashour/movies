import 'dart:collection';
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:dotted_border/dotted_border.dart';
import '../home_components/fetch_data_from_api.dart';
import '../home_components/home_model.dart';
import '../search_components/search_text_field.dart';
import '../utils/app_colors.dart';

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
                prefixIcon: Lottie.asset("assets/json/icons/search.json",width: 20,height: 20),
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
                      return Lottie.asset("assets/json/icons/search_state_null.json");
                    }else if(snapshot.data == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(),);
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
                                /// TODO : NAVIGATE TO  MOVIE DETAILS
                              },
                              child: Padding(
                                padding:  EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3, color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Padding(
                                  padding: EdgeInsets.all(15.0),
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
                                                   textAlign: TextAlign.justify,
                                                   style: TextStyle(
                                                     fontSize: 10,
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
                                                     fontSize: 10,
                                                     color: Colors.white,
                                                     fontWeight: FontWeight.w500,
                                                   ), //Textstyle
                                                 ),
                                                 Spacer(),
                                                 Row(
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                   children: [
                                                     Icon(Icons.star,color: Colors.yellowAccent,),
                                                     SizedBox(width: 3,),
                                                     Text(
                                                       // date,
                                                       "${movie2.voteAverage}",
                                                       textAlign: TextAlign.justify,
                                                       style: TextStyle(
                                                         fontSize: 10,
                                                         color: Colors.white,
                                                         fontWeight: FontWeight.w500,
                                                       ), //Textstyle
                                                     ),
                                                   ],
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                  ]
                                        ),
                                      )
                            ),
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
