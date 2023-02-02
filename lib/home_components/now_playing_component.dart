



import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_application/home_components/category_model.dart';
import 'package:movie_application/home_components/home_model.dart';
import '../home_components/fetch_data_from_api.dart';
import '../screens/movie_details.dart';
import '../utils/api_services.dart';
import '../utils/app_colors.dart';

class NowPlayingComponent extends StatelessWidget {

  static const String routeName = "now_playing_component";


  @override
  Widget build(BuildContext context) {



    FetchData fetchData = FetchData();
      return  FutureBuilder(
              future: fetchData.fetchData(),
              builder: (context,snapshot) {
                List<HomeMoviesModel>? movie = snapshot.data;
                if (snapshot.data == null ||
                    snapshot.data == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                  return Center(child: Text("Something went wrong with now playing api",style: TextStyle(color: Colors.red,fontSize: 30),));
                }
                else {
                return   FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {},
                    ),
                    items: snapshot.data?.map(
                          (item) {
                        return GestureDetector(
                          key: Key('openMovieMinimalDetail'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Movie_Details(movieId: item.id)
                            )
                            );
                          },
                          child: Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      // fromLTRB
                                      Colors.transparent,
                                      Colors.black,
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                    stops: [0, 0.3, 0.5, 1],
                                  ).createShader(
                                    Rect.fromLTRB(0, 0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: CachedNetworkImage(
                                  height: 560.0,
                                  imageUrl: fetchData.imageUrl(item.backDropPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 16.0),
                                      child: Text(
                                        item.title!,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                );
              }

              // return ListView.builder(
              //     itemCount: movie?.length,
              //     itemBuilder: (context, index) {
              //       return Text(movie![index].title);
              //     }
              // );
            }
    );

  }
}
