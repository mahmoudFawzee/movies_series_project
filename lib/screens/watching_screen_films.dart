import 'package:flutter/material.dart';
import 'package:netflex_project/content/film.dart';
import 'package:netflex_project/content/films_info.dart';
import 'package:netflex_project/screens/favirote.dart';
import 'package:netflex_project/sub%20parts/down_tab_bar.dart';
import 'package:netflex_project/sub%20parts/settings.dart';
import 'package:url_launcher/url_launcher.dart' as urllancher;

class WatchAndDownloadFilms extends StatefulWidget {
  const WatchAndDownloadFilms({Key? key}) : super(key: key);
  static const pageRoute = '/filmsWatching';

  @override
  State<WatchAndDownloadFilms> createState() => _WatchAndDownloadFilmsState();
}

class _WatchAndDownloadFilmsState extends State<WatchAndDownloadFilms> {
  void goToHomePage(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const MyTabBar()));
  }

  Color? favIconColor=Colors.grey;

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
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addToFavirotes(myFilms[filmId], Favirotes.favirotesList);
          if (favIconColor == Colors.grey) {
            setState(() {
              favIconColor = Colors.orange;
            });
          } else {
            setState(() {
              favIconColor = Colors.grey;
            });
          }
        },
        backgroundColor: Theme.of(context).backgroundColor,
        child: Icon(
          Icons.star,
          color: favIconColor,
          size: 40,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).appBarTheme.backgroundColor,
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => goToHomePage(context),
                  icon: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Settings.pageRoute);
                  },
                  icon: const Icon(Icons.settings, size: 30),
                )
              ],
            ),
          )),
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
                        await urllancher.canLaunch(myFilms[filmId].url)
                            ? await urllancher.launch(myFilms[filmId].url)
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("not avilable")));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    myButton(
                      Icons.download,
                      'download',
                      context,
                      () async {
                        await urllancher.canLaunch('')
                            ? await urllancher.launch('')
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("not avilable")));
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
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

  void addToFavirotes(Film film, List fav) {
    if (fav.any((element) => film == element)) {
      fav.remove(film);
    } else {
      fav.add(film);
    }
  }
}
