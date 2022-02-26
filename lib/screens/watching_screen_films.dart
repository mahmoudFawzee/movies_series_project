import 'package:flutter/material.dart';
import 'package:netflex_project/content/films_info.dart';
import 'package:url_launcher/url_launcher.dart' as urllancher;

class WatchAndDownloadFilms extends StatelessWidget {
  const WatchAndDownloadFilms({Key? key}) : super(key: key);
  static const pageRoute = '/filmsWatching';

  @override
  Widget build(BuildContext context) {
    final routArges =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final int filmId = routArges['id'] as int;
    final String filmName = routArges['title'] as String;
    final String cover = routArges['cover'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(filmName),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(.1),
                        Colors.white.withOpacity(.6)
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
                          cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 200,
                      width: 380,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'about mavie : ',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                myFilms[filmId].hint,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    myButton(
                      Icons.tv,
                      'watch',
                      context,
                      () async {
                       await urllancher.canLaunch(myFilms[filmId].url)?await urllancher.launch(myFilms[filmId].url)
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
