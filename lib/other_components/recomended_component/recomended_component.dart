

import 'package:animate_do/animate_do.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_application/home_components/recomended_model.dart';

import '../../home_components/fetch_data_from_api.dart';
import '../../home_components/popular_model.dart';
import '../../screens/movie_details.dart';
import 'package:flutter/material.dart';

class RecomendedScreen extends StatefulWidget {
  @override
  State<RecomendedScreen> createState() => _RecomendedScreenState();
}

class _RecomendedScreenState extends State<RecomendedScreen> {

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    FetchData fetchData = FetchData();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 10),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text("Recomended Films", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),)),
              ),
              Expanded(
                child: FutureBuilder(
                    future: fetchData.fetchRecomendedMoviesData(),
                    builder: (context, snapshot) {
                      List<RecomendedMoviesModel>? movie = snapshot.data;
                      if (snapshot.data == null) {
                        return Image.network(
                          "https://assets.stickpng.com/thumbs/5eaa8fc70494d70004e7fa08.png",
                           width: 150,
                           height: 200,
                        );
                      } else if (snapshot.data == ConnectionState.waiting) {
                        return Center(child: Lottie.network(
                          "https://assets5.lottiefiles.com/packages/lf20_j1adxtyb.json",),);
                      } else if (snapshot.hasError) {
                        return Center(child: Text(
                          "Something went wrong with popular api",
                          style: TextStyle(color: Colors.red, fontSize: 30),));
                      } else {
                        return FadeIn(
                          duration: const Duration(milliseconds: 500),
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0),
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              final movie2 = snapshot.data?[index];
                              // String date = DateFormat('yyyy-MM-dd').format(movie2!.releaseDate);
                              return InkWell(

                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Movie_Details(movieId: movie2.id)
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
                                                    borderType: BorderType
                                                        .RRect,
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
                                                      child: Image.network(
                                                        fetchData.imageUrl(
                                                            movie2!
                                                                .backDropPath),
                                                        fit: BoxFit.cover,),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          movie2!.title,
                                                          // textAlign: TextAlign.justify,
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.white,
                                                            fontWeight: FontWeight
                                                                .bold,
                                                          ), //Textstyle
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          // date,
                                                          movie2.releaseDate
                                                              .split('-')[0],
                                                          textAlign: TextAlign
                                                              .justify,
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Colors.white,
                                                            fontWeight: FontWeight
                                                                .w500,
                                                          ), //Textstyle
                                                        ),
                                                        Spacer(),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            RatingBar.builder(
                                                              initialRating: stars(
                                                                  movie2
                                                                      .voteAverage),
                                                              // minRating: movie2.voteAverage<5?4:movie2.voteAverage,
                                                              unratedColor: Colors
                                                                  .grey,
                                                              itemCount: 8,
                                                              itemSize: 15,
                                                              itemBuilder: (
                                                                  context, _) =>
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amber,
                                                                    size: 5,),
                                                              onRatingUpdate: (
                                                                  rating) =>
                                                                  setState(() {
                                                                    rating =
                                                                        movie2
                                                                            .voteAverage;
                                                                    this.rating =
                                                                        rating;
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double stars(double rating) {
    if (rating > 8) {
      rating = 8;
    }
    else if (rating <= 8 && rating > 7.5) {
      rating = 7.5;
    } else if (rating <= 7.4 && rating > 7) {
      rating = 7;
    } else if (rating <= 7 && rating > 6.5) {
      rating = 6.5;
    }
    else if (rating <= 6.4 && rating > 6) {
      rating = 6;
    } else if (rating <= 6 && rating > 5.5) {
      rating = 5.5;
    } else if (rating <= 5.4 && rating > 5) {
      rating = 5;
    } else {
      rating = 4;
    }
    return rating;
  }
}