import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/home_components/popular_model.dart';
import 'package:shimmer/shimmer.dart';

import '../screens/movie_details.dart';
import 'fetch_data_from_api.dart';
import 'home_model.dart';

class PopularMoviesComponent  extends StatefulWidget {

  static ValueNotifier<String> titleFromPopularScreen = ValueNotifier('');

  @override
  State<PopularMoviesComponent> createState() => _PopularMoviesComponentState();
}

class _PopularMoviesComponentState extends State<PopularMoviesComponent> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    FetchData fetchData = FetchData();
    return FutureBuilder(
        future: fetchData.fetchNewReleaseMoviesData(),
        builder: (context, snapshot) {
          List<NewReleaseMoviesModel>? movie = snapshot.data;
          if (snapshot.data == null ||
              snapshot.data == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "Something went wrong with popular api",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ));
          } else {
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return  Movie_Details(
                                          movieId: movie2.id,
                                        );
                                    }
                                ));
                          },
                          child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      fetchData.imageUrl(movie2!.backDropPath),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 170.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                         )
                    );
                  },
                ),
              ),
            );
          }
        });
  }
}
