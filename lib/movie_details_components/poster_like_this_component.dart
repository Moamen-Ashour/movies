import 'package:flutter/material.dart';
import 'package:movie_application/movie_details_components/poster_component.dart';

class PosterLikeThisComponent extends StatefulWidget {
  bool isPressed;


  PosterLikeThisComponent(this.isPressed);

  @override
  State<StatefulWidget> createState() {
    return _PosterLikeThisComponent();
  }
}

class _PosterLikeThisComponent
    extends State<PosterLikeThisComponent> {




  @override
  Widget build(BuildContext context) {
    return Container(

      child: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/images/deadpool2.png',
            ),
          ),
          Positioned(
            // i don't know is that correct or not to use negative number
            top: -4,
            left: -7,
            child: SizedBox(
              height: 1,
              width: 1,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child:  Icon(
                        Icons.bookmark,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: IconButton(
                        onPressed:(){
                          setState(() {
                            widget.isPressed = !widget.isPressed;
                          });
                        },
                        // To Do Action
                        // need to add it into provider
                        icon: widget.isPressed == false ? Icon(Icons.check,color: Colors.yellowAccent,) :Icon(Icons.add,color: Colors.white,),
                        iconSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
