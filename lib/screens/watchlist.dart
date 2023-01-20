import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class WatchList extends StatelessWidget {

  static const String routeName = "watchlist";


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Watch List",style: TextStyle(color: AppColors.TestColor),),

    );
  }
}
