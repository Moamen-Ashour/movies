import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/home_components/home_model.dart';
import '../home_components/fetch_data_from_api.dart';
import '../home_components/now_playing_component.dart';
import '../utils/api_services.dart';
import '../utils/app_colors.dart';

class Home extends StatelessWidget {

  static const String routeName = "home";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NowPlayingComponent()
          );

  }
}
