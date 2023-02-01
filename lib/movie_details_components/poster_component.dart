import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/screens/watchlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PosterComponent extends StatefulWidget {

  String title;
  int id;
  String overView;
  bool  isPressed;
  String image;


  PosterComponent(this.title, this.id, this.isPressed, this.image,this.overView);

  @override
  State<StatefulWidget> createState() {
    return _PosterComponentState();
  }

}

class _PosterComponentState extends State<PosterComponent> {

  late DatabaseReference dbRef;

  bool isPressed = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("Movie");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: 100,
          height: 150,
          child: Image.network(
            widget.image,
          fit: BoxFit.fill,
          ),
        ),
        Positioned(
           top: -3,
          child: IconButton(onPressed: () async{



            if(isPressed == true){
              setState(() {
                isPressed = !isPressed;
                Map<String,String> movie={
                  'title' : widget.title,
                  'image' : widget.image,
                  'overview' : widget.overView.toString(),
                  'id'    : widget.id.toString(),

                };
                dbRef.push().set(movie);
              });

            }else{
              isPressed == false;
            }

          }, icon: Container(
            height: double.infinity,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white, width: 5), <--- remove this
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                  color: Colors.grey
              ),
              child: Icon(isPressed == false ?Icons.check : Icons.add ,color: Colors.white,)),

          ),
        ),
      ],
    );
  }


}