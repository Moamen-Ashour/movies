import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class Browse extends StatelessWidget {

  static const String routeName = "browse";


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Browse",style: TextStyle(color: AppColors.TestColor),),
    );
  }
}
