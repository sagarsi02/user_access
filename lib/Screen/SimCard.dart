import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
import 'package:permission_handler/permission_handler.dart';

class sim_card extends StatefulWidget {
  const sim_card({Key? key}) : super(key: key);

  @override
  State<sim_card> createState() => _sim_cardState();
}

class _sim_cardState extends State<sim_card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIM Access'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.sim_card),
          label: const Text("Allow SIM"),
          onPressed: () async {
            PermissionStatus simStatus = await Permission.microphone.request();

            if(simStatus == PermissionStatus.granted){
              print('Permission Granted');
            }
            if(simStatus == PermissionStatus.denied){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission is recommended.")));
            }
            if(simStatus == PermissionStatus.permanentlyDenied){
              openAppSettings();
            }
          },
        ),
      ),
      drawer: const SideBar(),
    );
  }
}
