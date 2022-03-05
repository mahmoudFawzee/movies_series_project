import 'package:flutter/material.dart';
import 'package:netflex_project/sub%20parts/drawer.dart';
import 'package:netflex_project/wedgets/favirote_item.dart';

class Favirotes extends StatefulWidget {
  const Favirotes({Key? key}) : super(key: key);
  static const String pageRoute = '/favirotes';
  static List favirotesList = [];

  @override
  State<Favirotes> createState() => _FavirotesState();
}

class _FavirotesState extends State<Favirotes> {
  List fav = Favirotes.favirotesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('favirotes'),
      ),
      body: ListView.builder(
          itemCount: fav.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                FaviroteItem(
                  cover: fav.elementAt(index).cover,
                  name: fav.elementAt(index).name,
                  id: fav.elementAt(index).id,
                ),
              ],
            );
          }),
      drawer: const MyDrawer(),
    );
  }
}
