import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
import 'package:permission_handler/permission_handler.dart';

class storage extends StatefulWidget {
  const storage({Key? key}) : super(key: key);

  @override
  State<storage> createState() => _storageState();
}

class _storageState extends State<storage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Access'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.folder),
          label: const Text("Allow Storage"),
          onPressed: () async {
            PermissionStatus storageStatus = await Permission.storage.request();

            if(storageStatus == PermissionStatus.granted){
              print('Permission Granted');
            }
            if(storageStatus == PermissionStatus.denied){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission is recommended.")));
            }
            if(storageStatus == PermissionStatus.permanentlyDenied){
              openAppSettings();
            }
          },
        ),
      ),
      drawer: const SideBar(),
    );
  }
}
