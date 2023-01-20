import 'package:flutter/material.dart';
import 'package:movie_application/utils/app_colors.dart';

class Movie_Details extends StatelessWidget {

  static const String routeName = "movieDetails";


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Movie Details",style: TextStyle(color: AppColors.TestColor),),

    );
  }
}
