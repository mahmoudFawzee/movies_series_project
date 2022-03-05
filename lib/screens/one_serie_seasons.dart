import 'package:flutter/material.dart';
import 'package:netflex_project/content/series.dart';
import 'package:netflex_project/content/series_info.dart';
import 'package:netflex_project/screens/favirote.dart';
import 'package:netflex_project/sub%20parts/down_tab_bar.dart';
import 'package:netflex_project/sub%20parts/drawer.dart';
import 'package:netflex_project/sub%20parts/settings.dart';
import 'package:netflex_project/wedgets/series_seasons.dart';

class OneSerieSeasons extends StatefulWidget {
  static const String pageRoute = '/oneSerie';
  //static List<ASerie> favirotesList = [];

  const OneSerieSeasons({Key? key}) : super(key: key);

  @override
  State<OneSerieSeasons> createState() => _OneSerieSeasonsState();
}

class _OneSerieSeasonsState extends State<OneSerieSeasons> {
  void goToHomePage(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const MyTabBar()));
  }

  @override
  Widget build(BuildContext context) {
    final routArges =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final int _serieId = routArges['id'] as int;
    final String _seiresName = routArges['name'] as String;
    final String _cover = routArges['cover'] as String;
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.blue[900]!.withOpacity(.5),
        title: Text(
          _seiresName,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                height: 200,
                width: 380,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('about serie : ',
                              style: TextStyle(
                                fontSize: 20,
                                // color: Colors.blue[900],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            myAllSeries[_serieId].hint,
                            style: const TextStyle(
                              fontSize: 20,
                              // color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: allSeries[_serieId].seasons.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return SeriesSeasonsForm(
                      seriesName: _seiresName,
                      cover: _cover,
                      seriesSeason: allSeries[_serieId].seasons[index].season,
                      id: myAllSeries[_serieId].id,
                    );
                  }),
            ],
          ),
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            addToFavirotes(allSeries[_serieId], Favirotes.favirotesList),
        backgroundColor: Theme.of(context).backgroundColor,
        child: Icon(
          Icons.star_border,
          color: Theme.of(context).colorScheme.secondary,
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
    );
  }

  Widget selectedType(String type, selectedPage) {
    return InkWell(
      onTap: selectedPage,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 30,
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              // color: Color(0xFFF3E8EE),
            ),
            child: Center(
              child: Text(
                type,
                style: const TextStyle(
                  // color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }

  void addToFavirotes(ASerie aSerie, List fav) {
    if (fav.any((element) => aSerie == element)) {
    } else {
      fav.add(aSerie);
    }
  }
}
