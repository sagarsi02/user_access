import 'package:flutter/material.dart';
import 'package:user_access/Screen/Microphone.dart';
import 'package:user_access/Screen/Camera.dart';
import 'package:user_access/Screen/Contact.dart';
import 'package:user_access/Screen/Location.dart';
import 'package:user_access/Screen/SimCard.dart';
import 'package:user_access/Screen/Bluetooth.dart';
import 'package:user_access/Screen/Storage.dart';
import 'package:user_access/Screen/Home.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://source.unsplash.com/random/200x200/?Users'
              ),
            ),
            accountName: Text('Sagar Singh'),
            accountEmail: Text('sagarsingh@grampower.com'),
            decoration: BoxDecoration(color: Colors.purple),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: (){
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => const home()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.mic),
            title: const Text('MicroPhone'),
            onTap: (){
              Navigator.push(
                  context,MaterialPageRoute(builder: (context) => const microphone()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Camera'),
            onTap: (){
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => const camera()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Contact'),
            onTap: (){
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => const contact()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Location'),
            onTap: (){
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => const location()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sim_card),
            title: const Text('SIM Card'),
            onTap: (){
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => const sim_card()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bluetooth),
            title: const Text('Bluetooth'),
            onTap: (){
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => const bluetooth()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('File'),
            onTap: (){
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => const storage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('account'),
            onTap: null,
          ),

          ListTile(
            leading: const Icon(Icons.done),
            title: const Text('money'),
            onTap: null,
          ),

          ListTile(
            leading: const Icon(Icons.dangerous),
            title: const Text('risk'),
            onTap: null,
          ),
        ],
      ),
    );
  }
}

