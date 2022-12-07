import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
import 'package:permission_handler/permission_handler.dart';


class microphone extends StatefulWidget {
  const microphone({Key? key}) : super(key: key);

  @override
  State<microphone> createState() => microphoneState();
}

class microphoneState extends State<microphone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Microphone Access'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.mic),
          label: const Text("Allow Microphone"),
          onPressed: () async {
            PermissionStatus microphoneStatus = await Permission.microphone.request();

            if(microphoneStatus == PermissionStatus.granted){
              print('Permission Granted');
            }
            if(microphoneStatus == PermissionStatus.denied){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission is recommended.")));
            }
            if(microphoneStatus == PermissionStatus.permanentlyDenied){
              openAppSettings();
            }
          },
        ),
      ),
      drawer: const SideBar(),
    );
  }
}
