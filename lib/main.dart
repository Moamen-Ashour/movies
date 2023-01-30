import 'package:flutter/material.dart';
import 'package:movie_application/screens/browse.dart';
import 'package:movie_application/screens/home.dart';
import 'package:movie_application/screens/movie_details.dart';
import 'package:movie_application/screens/search.dart';
import 'package:movie_application/screens/watchlist.dart';

import 'layout/layout.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Layout.routeName,
      routes: {
        Layout.routeName :(context) =>  Layout(),
        Home.routeName :(context) =>  Home(),
        // Movie_Details.routeName :(context) =>  Movie_Details(movieId: ),
        Search.routeName :(context) =>  Search(),
        Browse.routeName :(context) =>  Browse(),
        WatchList.routeName :(context) =>  WatchList(),
      },
    );
  }
}


