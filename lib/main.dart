import 'package:flutter/material.dart';
import 'package:netflex_project/my_app_theme.dart';
import 'package:netflex_project/screens/downloads.dart';
import 'package:netflex_project/screens/favirote.dart';
import 'package:netflex_project/screens/one_serie_seasons.dart';
import 'package:netflex_project/screens/season_eposids.dart';
import 'package:netflex_project/screens/watching_screen_films.dart';
import 'package:netflex_project/screens/watching_screen_series.dart';
import 'package:netflex_project/sub%20parts/settings.dart';
import 'package:netflex_project/sub%20parts/splach_screen.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //because it's with changeNotifier class
    //currentTheme class object 
    currentTheme.addListener (() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currntTheme,  //currentTheme class object .currentTheme method
      routes: {
        '/': (ctx) => const SplashScreen(),
        OneSerieSeasons.pageRoute: (ctx) => const OneSerieSeasons(),
        SeasonEposids.pageRoute: (ctx) => const SeasonEposids(),
        Favirotes.pageRoute: (ctx) => const Favirotes(),
        Downloads.pageRoute: (ctx) => const Downloads(),
        Settings.pageRoute: (ctx) => const Settings(),
        WatchAndDownloadFilms.pageRoute: (ctx) => const WatchAndDownloadFilms(),
        WatchAndDownloadSeries.pageRoute: (ctx) =>
            const WatchAndDownloadSeries(),
      },
    );
  }
}
