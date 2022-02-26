import 'package:flutter/material.dart';
import 'package:netflex_project/screens/watching_screen_films.dart';

class FilmForm extends StatelessWidget {
  final int id;
  final String cover;
  final String filmName;
  // ignore: use_key_in_widget_constructors
  const FilmForm({
    required this.id,
    required this.cover,
    required this.filmName,
  });
  nextWidget(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(WatchAndDownloadFilms.pageRoute, arguments: {
      'id': id,
      'cover': cover,
      'title': filmName,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => nextWidget(context),
      child: Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              const Color(
                0xFFF5CEC7,
              ).withOpacity(0.1),
              const Color(
                0xFFF5CEC7,
              ).withOpacity(0.3)
            ],
            // begin: Alignment.topCenter,
            //end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        cover,
                        width: 220,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(.0)
                    ],
                    begin: Alignment.center,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              const Positioned(
                top: 200,
                left: 10,
                child: Text(
                  '',
                  // filmName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
