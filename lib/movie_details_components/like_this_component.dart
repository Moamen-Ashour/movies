import 'package:flutter/material.dart';
import 'package:movie_application/movie_details_components/poster_like_this_component.dart';

class LikeThisComponent extends StatefulWidget {

  bool isPressed;


  LikeThisComponent(this.isPressed);

  @override
  State<StatefulWidget> createState() {
    return _like_this_componentState();
  }
}

class _like_this_componentState extends State<LikeThisComponent> {




  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color(0xff707070),
                border: Border.all(
                    color: Colors.white24
                ),
                borderRadius: BorderRadius.all(Radius.circular(7))
            ),
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PosterLikeThisComponent(widget.isPressed),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Star Picture
                    SizedBox(
                      width: 3,
                    ),
                    Image.asset('assets/images/star.png',height: 10,),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '7.7',style: TextStyle(
                        color: Colors.white,fontSize: 10
                    ),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Deadpool2',style: TextStyle(
                        color: Colors.white,fontSize: 10
                    ),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '2018 R 1h 59m',style: TextStyle(
                        color: Colors.grey,fontSize: 8
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ],

    );
  }
}
