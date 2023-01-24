import 'package:flutter/material.dart';
import 'package:movie_application/screens/browse.dart';
import 'package:movie_application/screens/movie_details.dart';
import 'package:movie_application/screens/watchlist.dart';
import 'package:movie_application/utils/app_colors.dart';

import '../screens/home.dart';
import '../screens/search.dart';

class Layout extends StatefulWidget {

  static const String routeName = "layout";

  @override
  State<Layout> createState() => _LayoutState();

}

class _LayoutState extends State<Layout> {

  int index = 0;

  final screen = [
   Home(), //  Movie_Details screen we will show it after select a movie on Home screen
   Search(),
   Browse(),
   WatchList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
      backgroundColor: AppColors.BGColor,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: AppColors.IndecatorColor,
          iconTheme:  MaterialStateProperty.all(IconThemeData(color: AppColors.FontandIconNBColor)),
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14,color: AppColors.FontandIconNBColor,fontWeight: FontWeight.bold)
          )
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          animationDuration: Duration(seconds: 3),
          backgroundColor: AppColors.BGNBColor,
          selectedIndex: index,
          onDestinationSelected: (index){
            setState(() => this.index = index);
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home",selectedIcon: Icon(Icons.home,size: 30,color: AppColors.SelectedFontandIconNBColor,),),
            NavigationDestination(icon: Icon(Icons.search_outlined), label: "Search",selectedIcon: Icon(Icons.search,size: 30,color: AppColors.SelectedFontandIconNBColor,),),
            NavigationDestination(icon: Icon(Icons.movie_creation_outlined), label: "Browse",selectedIcon: Icon(Icons.movie_creation,size: 30,color: AppColors.SelectedFontandIconNBColor,),),
            NavigationDestination(icon: Icon(Icons.featured_play_list_outlined), label: "Watch List",selectedIcon: Icon(Icons.featured_play_list,size: 30,color: AppColors.SelectedFontandIconNBColor,),),
          ],
        ),
      ),
    );
  }
}
