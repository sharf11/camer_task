import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CameraScreen.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<Home>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Home"),
       centerTitle: true,
       backgroundColor: Colors.teal,
     ),
     body: Center(
       child:  Padding(
         padding:  EdgeInsets.only(
           left: MediaQuery.of(context).size.width*.05,
           right: MediaQuery.of(context).size.width*.05
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             GestureDetector(
               onTap: ()async{
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => CameraScreen()),
                 );
               },
               child: Container(
                   width: MediaQuery.of(context).size.width*.4,
                   height: MediaQuery.of(context).size.height*.065,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Colors.teal
                   ),
                   child: Text("Camera", style: TextStyle(color: Colors.white),)
               ),
             ),
             GestureDetector(
               onTap: ()async{

               },
               child: Container(
                   width: MediaQuery.of(context).size.width*.4,
                   height: MediaQuery.of(context).size.height*.065,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Colors.teal
                   ),
                   child: Text("Images",style: TextStyle(color: Colors.white),)
               ),
             ),
           ],
         ),
       )
     ),
   );
  }
}