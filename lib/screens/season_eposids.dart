import 'package:flutter/material.dart';
import 'package:netflex_project/content/series_info.dart';
import 'package:netflex_project/sub%20parts/drawer.dart';
import 'package:netflex_project/wedgets/season_eposids.dart';

class SeasonEposids extends StatelessWidget {
  static const String pageRoute = '/seasonEposids';

  const SeasonEposids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routArges =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    int season = routArges['season'] as int;
    int seriesId = routArges['id'] as int;
    final String cover = routArges['cover'] as String;
    final String name = routArges['name'] as String;
    return Scaffold(
      appBar: AppBar(
      //  backgroundColor: Colors.blue[900]!.withOpacity(.5),
        title: Text(
          name,
          style: const TextStyle(
            //color: Colors.black,
             fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20.0, right: 10, left: 10, bottom: 10),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: allSeries[seriesId].seasons[season - 1].eposids.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 250,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return OneSeriesEposids(
                seriesName: name,
                cover: cover,
                eposideNumber: allSeries[seriesId]
                    .seasons[season - 1]
                    .eposids[index]
                    .numberOfEposid,
                id: seriesId,
                seasonNum:season-1,
              );
            }),
      ),
    );
  }
}
