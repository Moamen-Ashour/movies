import 'package:flutter/material.dart';
import 'package:movie_application/utils/app_colors.dart';

import '../layout/container.dart';
import '../movie_details_components/film_type_border.dart';
import '../movie_details_components/like_this_component.dart';
import '../movie_details_components/poster_component.dart';
import '../movie_details_components/poster_like_this_component.dart';

class Movie_Details extends StatefulWidget {
  static const String routeName = "movieDetails";

  @override
  State<Movie_Details> createState() => _Movie_DetailsState();
}

class _Movie_DetailsState extends State<Movie_Details> {

  bool  isPressed = true;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: AppColors.BGColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Drop and the lost city of gold"),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Film smail
          Stack(
            children: [
              Image.asset('assets/images/image_video.png',
                  fit: BoxFit.fitWidth),
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
                  'Drop and the lost city of gold',
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
                  '2019  PG-13  2h  7m',
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
              PosterComponent(isPressed),
              //Action
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilmTypeBorder("Action"),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        FilmTypeBorder("Action"),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        FilmTypeBorder("Action")
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Text(
                            'Having spent most of her life exploring Having spent most of her life exploring Having spent most of her life exploring '
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
                          child: Image.asset(
                            'assets/images/star.png',
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '7.7',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "More Like This",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
                        Container(
                 width: double.infinity,
                      height: 200,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.zero),
                           //   color: Color.fromRGBO(
                           //   54,
                           //   55,
                           //  54,
                           // 1.0,
                           //      ),
                        ),

       child: Expanded(
         flex: 5,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LikeThisComponent(isPressed),
                      LikeThisComponent(isPressed),
                      LikeThisComponent(isPressed)
                      // ContainerDeadPool(),
                      // ContainerDeadPool(),
                      // ContainerDeadPool(),
                    ],
                  ),
                ],
              ),
       ),
          ),

        ],
      ),
    );
  }
}
