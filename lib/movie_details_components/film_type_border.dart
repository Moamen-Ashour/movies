import 'package:flutter/material.dart';

class FilmTypeBorder extends StatelessWidget {

  String filmeType = "";


  FilmTypeBorder(this.filmeType);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 60,
      height: 28,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          border: Border.all(
              color: Colors.white,
              width: 1
          )
      ),
      child: Center(
        child: Text(
          filmeType,style: TextStyle(
            color: Colors.grey,fontSize: 8
        ),),
      ),
    );
  }
}
