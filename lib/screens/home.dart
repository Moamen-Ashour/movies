import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class Home extends StatelessWidget {

  static const String routeName = "home";


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home",style: TextStyle(color: AppColors.TestColor),),

    );
  }
}
