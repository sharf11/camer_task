import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _state();
  }
}
class _state extends State<Splash>{
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), (){
      Navigator.of(context)
          .pushNamedAndRemoveUntil( "/Login",
              (Route<dynamic> route) => false);
    });

    return Container(
        decoration: new BoxDecoration(

            color: Colors.teal
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.12,),
            Text("Camera Task",style: TextStyle(decoration: TextDecoration.none,fontSize: 25,color: Colors.white),),
            Expanded(child: SizedBox()),
            SizedBox(height: 3,),
            Text("Please Waite For Application Loading",style: TextStyle(decoration: TextDecoration.none,fontSize: 13,color: Colors.white),),
            SizedBox(height: MediaQuery.of(context).size.height*.1,)
          ],
        )
    );
  }
}