import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/home_components/home_model.dart';

import '../home_components/category_component.dart';
import '../home_components/category_model.dart';
import '../home_components/fetch_data_from_api.dart';
import '../utils/app_colors.dart';

class Browse extends StatelessWidget {

  static const String routeName = "browse";


  @override
  Widget build(BuildContext context) {
    FetchData fetchData = FetchData();
    return SafeArea(
      child: FutureBuilder(
          future: fetchData.fetchCategoriesData(),
          builder: (context, snapshot) {
            List<CategoryModel>? categories = snapshot.data;
            if (snapshot.data == null) {
              return Text("null data", style: TextStyle(color: Colors.white),);
            } else if (snapshot.data == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            } else if (snapshot.hasError) {
              return Center(child: Text("Something went wrong",
                style: TextStyle(color: Colors.red, fontSize: 30),));
            } else {
              return
                FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: ListView.builder(
                    // shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final movie2 = snapshot.data?[index];
                      return InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE List
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffD3D3D3)
                                    )
                                  ),
                                  child: Image.network("https://www.shutterstock.com/image-vector/online-cinema-art-movie-watching-260nw-586719869.jpg",
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0,right: 10),
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                   // color: Colors.red,
                                      child: Text('${showGenres(categories!,index).toString().replaceAll('{', '').replaceAll('}', '')} Movies',style:TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                      ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,)
                          ],
                        ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //       color: Colors.red,
                        //     borderRadius: BorderRadius.circular(8.0),
                        //     border: Border.all(
                        //       color: Colors.white
                        //     )
                        //   ),
                        //   child: Stack(
                        //       children: <Widget>[
                        //         // Image.asset("assets/images/category.jpg",),
                        //         Center(child:
                        //         Text('${showGenres(categories!)} Movies',style:TextStyle(
                        //           color: Colors.white,
                        //           fontWeight: FontWeight.bold
                        //
                        //         ),
                        //         ),
                        //         ),
                        //       ]
                        //   )
                        //
                        // ),
                      );
                    },),
                );
            }
          }),
    );
  }


  Set<String?> showGenres(List<CategoryModel> genres,int index) {
    String result = '';
    Set<String> names ={};
    final seen = Set<CategoryModel>();
    final unique = genres.where((str) => seen.add(str)).toList();
    for (int i = 0;i<unique.length;i++) {
      names.add(unique[index].name);
    }

    // print(names);
    // result = .;
    names.toString().replaceAll('{', '').replaceAll('}', '');
    names.join(", ");
    return names;
  }


  String? getTextElement(Set<String?> list) {
    return list.firstWhere((e) => e is String);
  }

}