import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_components/fetch_data_from_api.dart';
import '../home_components/popular_movies_component.dart';
import '../utils/app_colors.dart';
import 'movie_details.dart';

class WatchList extends StatefulWidget {

  static const String routeName = "watchlist";

  int? id=0;
  String? title="";


  WatchList({this.id,required this.title});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Movie');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Movie');
  FetchData fetchData = FetchData();

  Widget listItem({required Map movie}) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 150,
        width: 150,
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
                      child: Image.network(
                        movie['image'], fit: BoxFit.fill,width: 100,height: 100,),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          movie['title'],
                          // textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ), //Textstyle
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Text(
                            movie['overview'].toString()
                              ,textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w400,color: Colors.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            reference.child(movie['key']).remove();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red[700],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
          body: Container(
            height: double.infinity,
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map movie = snapshot.value as Map;
                movie['key'] = snapshot.key;

                return listItem(movie: movie);
              },
            ),
          )
      ),
    );
  }

/*
      ----------------------

      Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie['title'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie['overview'].toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie['id'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(movie['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
*/

    //   ListView.builder(
    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //   itemCount: 2,
    //   itemBuilder: (context, index) {
    //     // final movie2 = snapshot.data?[index];
    //     // String date = DateFormat('yyyy-MM-dd').format(movie2!.releaseDate);
    //     return InkWell(
    //
    //         onTap: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Movie_Details(movieId: movie2.id)
    //           )
    //           );
    //         },
    //         child: Container(
    //             height: 100,
    //             width: 100,
    //             // decoration: BoxDecoration(
    //             //   border: Border.all(width: 0, color: Colors.white),
    //             //   borderRadius: BorderRadius.all(Radius.circular(30)),
    //             // ),
    //             child: Column(
    //                 children: [
    //                   Expanded(
    //                     child: Row(
    //                       children: [
    //                         DottedBorder(
    //                           borderType: BorderType.RRect,
    //                           radius: Radius.circular(10),
    //                           // padding: EdgeInsets.all(6),
    //                           dashPattern: [6, 3, 2, 3],
    //                           strokeWidth: 2,
    //                           color: Colors.white,
    //                           child: Container(
    //                             height: 150,
    //                             width: 120,
    //                             // decoration: BoxDecoration(
    //                             //   border: Border.all(width: 2, color: Colors.white70),
    //                             //   borderRadius: BorderRadius.circular(10),
    //                             // ),
    //                             child:  Image.network(fetchData.imageUrl(movie2!.backDropPath),fit: BoxFit.cover,),
    //                           ),
    //                         ),
    //                         Expanded(
    //                           child: Column(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               Text(
    //                                 movie2!.title,
    //                                 // textAlign: TextAlign.justify,
    //                                 style: TextStyle(
    //                                   fontSize: 11,
    //                                   color: Colors.white,
    //                                   fontWeight: FontWeight.bold,
    //                                 ), //Textstyle
    //                               ),
    //                               Spacer(),
    //                               Text(
    //                                 // date,
    //                                 movie2.releaseDate.split('-')[0],
    //                                 textAlign: TextAlign.justify,
    //                                 style: TextStyle(
    //                                   fontSize: 11,
    //                                   color: Colors.white,
    //                                   fontWeight: FontWeight.w500,
    //                                 ), //Textstyle
    //                               ),
    //                               Spacer(),
    //                               Row(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children:  [
    //                                   RatingBar.builder(
    //                                     initialRating: stars(movie2.voteAverage),
    //                                     // minRating: movie2.voteAverage<5?4:movie2.voteAverage,
    //                                     unratedColor: Colors.grey,
    //                                     itemCount: 8,
    //                                     itemSize: 15,
    //                                     itemBuilder: (context,_) => Icon(Icons.star,color: Colors.amber,size: 5,),
    //                                     onRatingUpdate: (rating) => setState(() {
    //                                       rating = movie2.voteAverage;
    //                                       this.rating = rating;
    //                                     },
    //                                     ),
    //                                   ),
    //
    //                                   // Text.rich(
    //                                   //   TextSpan(
    //                                   //     style: TextStyle(
    //                                   //       fontSize: 5,
    //                                   //       color: Colors.white
    //                                   //     ),
    //                                   //     children: [
    //                                   //       // WidgetSpan(
    //                                   //       //   child: Row(
    //                                   //       //     children: [
    //                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,),
    //                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,),
    //                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,),
    //                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,),
    //                                   //       //       Icon(Icons.star,color: Colors.yellowAccent,size: 10,)
    //                                   //       //     ],
    //                                   //       //   ),
    //                                   //       // ),
    //                                   //       TextSpan(
    //                                   //         text: "${movie2.voteAverage}",
    //                                   //       )
    //                                   //     ],
    //                                   //   ),
    //                                   // ),
    //                                   // Icon(Icons.star,color: Colors.yellowAccent,),
    //                                   // SizedBox(width: 3,),
    //                                   // Text(
    //                                   //   // date,
    //                                   //   "${movie2.voteAverage}",
    //                                   //   textAlign: TextAlign.justify,
    //                                   //   style: TextStyle(
    //                                   //     fontSize: 10,
    //                                   //     color: Colors.white,
    //                                   //     fontWeight: FontWeight.w500,
    //                                   //   ), //Textstyle
    //                                   // ),
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   Divider(
    //                     thickness: 1,
    //                     color: Colors.white,
    //                   ),
    //                 ]
    //             )
    //         )
    //     );
    //
    //   },
    // );
  }

