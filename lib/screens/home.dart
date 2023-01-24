import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/home_components/home_model.dart';
import '../home_components/fetch_data_from_api.dart';
import '../home_components/now_playing_component.dart';
import '../home_components/popular_movies_component.dart';
import '../home_components/recomended_movies_component.dart';
import '../other_components/new_release_components/new_release_component.dart';
import '../other_components/recomended_component/recomended_component.dart';
import '../utils/api_services.dart';
import '../utils/app_colors.dart';
import 'movie_details.dart';

class Home extends StatelessWidget {

  static const String routeName = "home";


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
    body: ListView(
    children: <Widget>[
    NowPlayingComponent(),
      Container(
        margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Release",
              style: GoogleFonts.poppins(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewReleaseScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('See More',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    PopularMoviesComponent(),
      Container(
        margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recomended",
              style: GoogleFonts.poppins(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Movie_Details()));

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text('See More',
                      style: TextStyle(
                        color: Colors.black,
                      ),),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    RecomendedMoviesComponent(),
    SizedBox(height: 50.0)
  ],
),
    );

  }
}
