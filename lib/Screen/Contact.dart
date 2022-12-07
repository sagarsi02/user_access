import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
import 'package:permission_handler/permission_handler.dart';

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Access'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.phone),
          label: const Text("Allow Contact"),
          onPressed: () async {
            PermissionStatus conatactStatus = await Permission.contacts.request();

            if(conatactStatus == PermissionStatus.granted){
              print('Permission Granted');
            }
            if(conatactStatus == PermissionStatus.denied){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission is recommended.")));
            }
            if(conatactStatus == PermissionStatus.permanentlyDenied){
              openAppSettings();
            }
          },
        ),
      ),
      drawer: const SideBar(),
    );
  }
}
