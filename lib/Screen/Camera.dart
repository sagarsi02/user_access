import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
import 'package:permission_handler/permission_handler.dart';

class camera extends StatefulWidget {
  const camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Access'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text("Allow Camera"),
          onPressed: () async {
            PermissionStatus cameraStatus = await Permission.camera.request();
            if(cameraStatus == PermissionStatus.granted){
              print('Permission Granted');
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
      drawer: const SideBar(),
    );
  }
}
