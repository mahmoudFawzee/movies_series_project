import 'package:flutter/material.dart';
import 'package:netflex_project/content/series_info.dart';
import 'package:url_launcher/url_launcher.dart'as urllancher;

class WatchAndDownloadSeries extends StatefulWidget {
  const WatchAndDownloadSeries({Key? key}) : super(key: key);
  static const pageRoute = '/seriesWatching';

  @override
  State<WatchAndDownloadSeries> createState() => _WatchAndDownloadSeriesState();
}

class _WatchAndDownloadSeriesState extends State<WatchAndDownloadSeries> {
  @override
  Widget build(BuildContext context) {
    final routArges =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final int _serieId = routArges['id'] as int;
    final int _epNumber = routArges['epId'] as int;
    final String _name = routArges['name'] as String;
    final String _cover = routArges['cover'] as String;
    final int _seasonNumber = allSeries[_serieId].seasons[_serieId].season;
    return Scaffold(
      appBar: AppBar(
        title: Text(_name),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(.1),
                        Colors.white.withOpacity(.8)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [.15, .75])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        top: 10,
                      ),
                      child: SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: Image.network(
                          _cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 320,
                      child: Center(
                        child: Text(
                          'season : $_seasonNumber , episode $_epNumber',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    myButton(
                      Icons.tv,
                      'watch',
                      context,
                         () async {
                       await urllancher.canLaunch(allSeries[_serieId].seasons[_seasonNumber-1].url)?await urllancher.launch(allSeries[_serieId].seasons[_seasonNumber-1].url)
                        : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("not avilable")));
                      
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    myButton(Icons.download, 'download', context, () async {
                       await urllancher.canLaunch('')?await urllancher.launch('')
                        : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("not avilable")));
                      
                      },),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox myButton(IconData icon, String action, BuildContext ctx, whatToDo) {
    return SizedBox(
      height: 40,
      width: 200,
      child: ElevatedButtonTheme(
        data: Theme.of(ctx).elevatedButtonTheme,
        child: ElevatedButton(
          onPressed: whatToDo,
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(icon),
              const SizedBox(
                width: 5,
              ),
              Center(child: Text(action))
            ]),
          ),
        ),
      ),
    );
  }
}
