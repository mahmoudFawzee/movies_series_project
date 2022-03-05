import 'package:flutter/material.dart';
import 'package:netflex_project/content/series.dart';
import 'package:netflex_project/content/series_info.dart';
import 'package:netflex_project/wedgets/series_wedget.dart';

class SeriesCategory extends StatefulWidget {
  const SeriesCategory({Key? key}) : super(key: key);

  @override
  State<SeriesCategory> createState() => _SeriesCategoryState();
}

class _SeriesCategoryState extends State<SeriesCategory> {
  int coverIndex = 0;
  changeCoverIndexForword() {
    if (coverIndex < myAllSeries.length - 1) {
      coverIndex++;
    } else {
      coverIndex = 0;
    }
  }

  changeCoverIndexBack() {
    if (coverIndex > 0) {
      coverIndex--;
    } else {
      coverIndex = myAllSeries.length - 1;
    }
  }

  List displayedSeries = myAllSeries;

  List filteredSeries(List<MySerie> list, String keyword) {
    List<MySerie> B = list;
    B = list.where((element) => element.type.contains(keyword)).toList();
    return B;
  }

  void filter(List<MySerie> list, String keyword) {
    displayedSeries = filteredSeries(list, keyword);
  }

  void filterSearch(List<MySerie> list, String keyWord) {
    displayedSeries = filterBySearch(list, keyWord);
  }

  List filterBySearch(List<MySerie> list, String keyWord) {
    List<MySerie> B = list;
    B = list.where((element) => element.name.contains(keyWord.toLowerCase())).toList();
    return B;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black,
                  )
                ],
              ),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text(
                          'Series',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://images.indianexpress.com/2021/08/money-heist-professor-1200.jpg'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Text(
                          'user name ',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'user123@gmail.com',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            seriesContent(),
          ],
        ),
      ),
    );
  }

  Widget seriesContent() {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyText1,
            onFieldSubmitted: (value) {
              setState(() {
                filterSearch(myAllSeries, value);
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.secondary,
              ),
              hintText: 'enter series name',
              hintStyle: Theme.of(context).textTheme.headline6,
              alignLabelWithHint: true,
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              focusedBorder: const UnderlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            //shrinkWrap: true,
            children: [
              selectedType('All', () {
                setState(() {
                  displayedSeries = myAllSeries;
                });
              }),
              selectedType('Action', () {
                setState(() {
                  filter(myAllSeries, 'A');
                });
              }),
              selectedType('Romance', () {
                setState(() {
                  filter(myAllSeries, 'R');
                });
              }),
              selectedType('Comedy', () {
                setState(() {
                  filter(myAllSeries, 'C');
                });
              }),
              selectedType('Dramatic', () {
                setState(() {
                  filter(myAllSeries, 'D');
                });
              }),
              selectedType('Horror', () {
                setState(() {
                  filter(myAllSeries, 'HO');
                });
              }),
              selectedType('Heroes', () {
                setState(() {
                  filter(myAllSeries, 'HO');
                });
              }),
              selectedType('Fiction', () {
                setState(() {
                  filter(myAllSeries, 'F');
                });
              }),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: displayedSeries.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 250,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return SeriesForm(
                seriesName: displayedSeries[index].name,
                cover: displayedSeries[index].cover,
                serieId: displayedSeries[index].id,
              );
            }),
      ],
    );
  }

  Widget selectedType(String type, filtering) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: filtering,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 30,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: Theme.of(context).backgroundColor),
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
}
