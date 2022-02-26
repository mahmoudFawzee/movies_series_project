import 'package:flutter/material.dart';
import 'package:netflex_project/sub%20parts/drawer.dart';
import 'package:netflex_project/wedgets/favirote_item.dart';

import 'one_serie_seasons.dart';

class Favirotes extends StatelessWidget {
  const Favirotes({Key? key}) : super(key: key);
  static const String pageRoute = '/favirotes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('favirotes'),
      ),
      body: ListView.builder(
          itemCount: OneSerieSeasons.favirotesList.length,
          itemBuilder: (context, index) {
            return FaviroteItem(
                cover: OneSerieSeasons.favirotesList[index].cover,
                name: OneSerieSeasons.favirotesList[index].name);
          }),
      drawer: const MyDrawer(),
    );
  }
}
