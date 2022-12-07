import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
import 'package:permission_handler/permission_handler.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Access'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.location_on_outlined),
          label: const Text("Allow Location"),
          onPressed: () async {
            PermissionStatus locationStatus = await Permission.location.request();

            if(locationStatus == PermissionStatus.granted){
              print('Permission Granted');
            }
            if(locationStatus == PermissionStatus.denied){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission is recommended.")));
            }
            if(locationStatus == PermissionStatus.permanentlyDenied){
              openAppSettings();
            }
          },
        ),
      ),
      drawer: const SideBar(),
    );
  }
}
