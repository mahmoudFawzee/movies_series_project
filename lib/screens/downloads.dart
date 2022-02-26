import 'package:flutter/material.dart';
import 'package:netflex_project/sub%20parts/drawer.dart';

class Downloads extends StatelessWidget {
  const Downloads({Key? key}) : super(key: key);
  static const pageRoute = '/downloads';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.blue[900]!.withOpacity(.5),
        title: const Text('Downloads'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
