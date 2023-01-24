



import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/home_components/recomended_model.dart';
import 'package:shimmer/shimmer.dart';

import 'fetch_data_from_api.dart';

class RecomendedMoviesComponent  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   FetchData fetchData = FetchData();
    return FutureBuilder(
        future: fetchData.fetchRecomendedMoviesData(),
        builder: (context, snapshot) {
          List<RecomendedMoviesModel>? movie = snapshot.data;
          if (snapshot.data == null ||
              snapshot.data == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text("Something went wrong with recomended api",style: TextStyle(color: Colors.red,fontSize: 30),));
          }else{
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final movie2 = snapshot.data?[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: fetchData.imageUrl(movie2!.backDropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        }
    );
  }






}