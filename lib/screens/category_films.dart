import 'package:flutter/material.dart';
import 'package:netflex_project/content/film.dart';
import 'package:netflex_project/content/films_info.dart';
import 'package:netflex_project/wedgets/film_widget.dart';

class FilmsCategory extends StatefulWidget {
  static const String pageRoute = '/filmsCategory';
  const FilmsCategory({Key? key}) : super(key: key);

  @override
  State<FilmsCategory> createState() => _FilmsCategoryState();
}

class _FilmsCategoryState extends State<FilmsCategory> {
  int coverIndex = 0;
  changeCoverIndexForword() {
    if (coverIndex < myFilms.length - 1) {
      coverIndex++;
    } else {
      coverIndex = 0;
    }
  }

  changeCoverIndexBack() {
    if (coverIndex > 0) {
      coverIndex--;
    } else {
      coverIndex = myFilms.length - 1;
    }
  }

  List displayedFilms = myFilms;

  List filteredMovies(List<Film> list, String keyword) {
    List<Film> B = list;
    B = list.where((element) => element.type.contains(keyword)).toList();
    return B;
  }

  void filter(List<Film> list, String keyword) {
    displayedFilms = filteredMovies(list, keyword);
  }

  void filterSearch(List<Film> list, String keyWord) {
    displayedFilms = filterBySearch(list, keyWord);
  }

  List filterBySearch(List<Film> list, String keyWord) {
    List<Film> B = list;
    B = list.where((element) => element.name.contains(keyWord)).toList();
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
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        right: 8,
                        left: 8,
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text(
                          'Films',
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
                          'https://static.wikia.nocookie.net/snl/images/e/e3/Robert_Downey_Jr..jpg/revision/latest/top-crop/width/360/height/450?cb=20200725224545'),
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
            filmsContent(),
          ],
        ),
      ),
    );
  }

  Widget filmsContent() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).backgroundColor
              ],
            ),
          ),
        ),
        ListView(
          primary: false,
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: 250,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  onFieldSubmitted: (value) {
                    setState(() {
                      filterSearch(myFilms, value);
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    hintText: 'enter film name',
                    hintStyle: Theme.of(context).textTheme.headline6,
                    alignLabelWithHint: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    focusedBorder: const UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  selectedType('All', () {
                    setState(() {
                      displayedFilms = myFilms;
                    });
                  }),
                  selectedType('Action', () {
                    setState(() {
                      filter(myFilms, 'A');
                    });
                  }),
                  selectedType('Romance', () {
                    setState(() {
                      filter(myFilms, 'R');
                    });
                  }),
                  selectedType('Comedy', () {
                    setState(() {
                      filter(myFilms, 'C');
                    });
                  }),
                  selectedType('Dramatic', () {
                    setState(() {
                      filter(myFilms, 'D');
                    });
                  }),
                  selectedType('Horror', () {
                    setState(() {
                      filter(myFilms, 'HO');
                    });
                  }),
                  selectedType('Heroes', () {
                    setState(() {
                      filter(myFilms, 'HE');
                    });
                  }),
                  selectedType('Fiction', () {
                    setState(() {
                      filter(myFilms, 'F');
                    });
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: displayedFilms.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return FilmForm(
                    filmName: displayedFilms[index].name,
                    cover: displayedFilms[index].cover,
                    id: displayedFilms[index].id,
                  );
                }),
          ],
        ),
      ],
    );
  }

  Widget selectedType(String type, filtering) {
    Color categorlyColor = Theme.of(context).backgroundColor;
    return ElevatedButtonTheme(
      data: Theme.of(context).elevatedButtonTheme,
      child: InkWell(
        onTap: filtering,
        borderRadius: BorderRadius.circular(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: categorlyColor,
              ),
              child: Center(
                child: Text(
                  type,
                  style: const TextStyle(
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
      ),
    );
  }
}
