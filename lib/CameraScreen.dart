import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraScreen> {
  String appDocPath="";
  String tempPath="";

  late CameraController controller;
  List<CameraDescription> cameras=[];
  late XFile picture;
   loadData()async{
     cameras = await availableCameras();
     controller = CameraController(cameras[0], ResolutionPreset.medium);
     controller.initialize().then((_) {
       if (!mounted) {
         return;
       }
       setState(() {});
     });
   }
  @override
  void initState() {
    super.initState();
   loadData();
   getpath();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Column(
        children: [
          CameraPreview(controller),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: ()async{
             picture= await controller.takePicture();
             File image=File(picture.path);
             //image.copy(tempPath);
             image.copySync(tempPath);
             print(appDocPath);
             print("success");
            },
            child: Icon(Icons.camera_alt_rounded,size: 100,),
          )
        ],
      ),
    );
  }
  getpath()async{
    Directory directory =await  getApplicationDocumentsDirectory(); // AppData folder path
    tempPath = directory.path ;
    setState(() {
    });
  }
}
