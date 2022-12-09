import 'package:camera/camera.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
import 'package:permission_handler/permission_handler.dart';

class camera extends StatefulWidget {

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {

  File? imageFile;
  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );

    setState(() {
      imageFile = File(pickedFile!.path);
    });
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Access'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            icon: const Icon(Icons.camera),
            label: const Text("Allow Camera"),
            onPressed: () async {
              PermissionStatus cameraStatus = await Permission.camera.request();
              if(cameraStatus == PermissionStatus.granted){
                _getFromCamera();
              }
              if(cameraStatus == PermissionStatus.denied){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission is recommended.")));
              }
              if(cameraStatus == PermissionStatus.permanentlyDenied){
                openAppSettings();
              }
            },
          ),
        ),
      ),
      drawer: const SideBar(),
    );
  }
}
