import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/main.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraScreen> {
  String appDocPath="";
  String tempPath="";

  late CameraController controller;
  @override
  void initState() {
    super.initState();
    getImage();
  }

/*  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: _image==null?Text("no image"):Image.file(_image),
      ) /*Column(
        children: [
       *//*   CameraPreview(controller),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: ()async{
             picture= await controller.takePicture();
             File image=File(picture.path);
             //image.copy(tempPath);
             GallerySaver.saveImage(image.path);
             image.copySync(tempPath);
             print(appDocPath);
             print("success");
            },
            child: Icon(Icons.camera_alt_rounded,size: 100,),
          )*//*
        ],
      )*/,
    );
  }
 /* getpath()async{
    Directory directory =await  getApplicationDocumentsDirectory(); // AppData folder path
    tempPath = directory.path ;
    setState(() {
    });
  }*/
  late File _image;
  final imagepicker=ImagePicker();
getImage()async{
  final image=await imagepicker.getImage(source: ImageSource.camera);
  setState(() {
    _image=File(image!.path);
    MyApp.images.add(_image);
  });
}
}
