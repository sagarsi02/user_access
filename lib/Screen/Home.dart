import 'package:flutter/material.dart';
import 'package:user_access/SideBar.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class  _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: const Center(
        child:Text(
          "Welcome to Users Access Panel",
        ),
      ),
      drawer: const SideBar(),
    );
  }
}
