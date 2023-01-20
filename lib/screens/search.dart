import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class Search extends StatelessWidget {

  static const String routeName = "search";


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search",style: TextStyle(color: AppColors.TestColor),),

    );
  }
}
