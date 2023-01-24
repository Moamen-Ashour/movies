import 'package:flutter/material.dart';

class PosterComponent extends StatefulWidget {

  bool  isPressed;

  PosterComponent(this.isPressed);

  @override
  State<StatefulWidget> createState() {
    return _PosterComponentState();
  }

}

class _PosterComponentState extends State<PosterComponent> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: Image.asset(
            'assets/images/image_video_detals@2x.png',
          ),
          width: 100,
        ),
        SizedBox(
          height: 1,
          width: 1,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  child:  Icon(
                    Icons.bookmark,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
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
      ],
    );
  }
}