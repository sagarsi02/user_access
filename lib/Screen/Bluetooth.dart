import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
import 'package:permission_handler/permission_handler.dart';

class bluetooth extends StatefulWidget {
  const bluetooth({Key? key}) : super(key: key);

  @override
  State<bluetooth> createState() => _bluetoothState();
}

class _bluetoothState extends State<bluetooth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Access'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.bluetooth),
          label: const Text("Allow Bluetooth"),
          onPressed: () async {
            PermissionStatus bluetoothStatus = await Permission.bluetooth.request();

            if(bluetoothStatus == PermissionStatus.granted){
              print('Permission Granted');
            }
            if(bluetoothStatus == PermissionStatus.denied){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission is recommended.")));
            }
            if(bluetoothStatus == PermissionStatus.permanentlyDenied){
              openAppSettings();
            }
          },
        ),
      ),
      drawer: const SideBar(),
    );
  }
}
