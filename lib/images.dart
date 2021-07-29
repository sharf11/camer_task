import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/main.dart';

class Images extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _state();
  }
}
class _state extends State<Images>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       child: ListView.builder(padding: EdgeInsets.only(top: 20),itemCount: MyApp.images.length,itemBuilder: (context,index){
         return  Container(
           margin: EdgeInsets.only(bottom: 10),
           child: Image.file(MyApp.images[index],
             height: MediaQuery.of(context).size.height*.2,
             width: MediaQuery.of(context).size.width,
           ),
         );
       }),
     ),
   );
  }
}