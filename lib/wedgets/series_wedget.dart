import 'package:flutter/material.dart';
import 'package:netflex_project/screens/one_serie_seasons.dart';

class SeriesForm extends StatelessWidget {
  final String cover;
  final String seriesName;
  final int serieId;
  // ignore: use_key_in_widget_constructors
  const SeriesForm({
    required this.cover,
    required this.seriesName,
    required this.serieId,
  });
  void nextPage(
    BuildContext ctx,
  ) {
    Navigator.of(ctx).pushNamed(OneSerieSeasons.pageRoute, arguments: {
      'name': seriesName,
      'id': serieId,
      'cover': cover,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => nextPage(context),
      child: Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              const Color(
                0xFFF5CEC7,
              ).withOpacity(.1),
              const Color(
                0xFFF5CEC7,
              ).withOpacity(.3)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
                        Colors.black.withOpacity(.1),
                        Colors.black.withOpacity(.0)
                      ],
                      begin: Alignment.center,
                      end: Alignment.topCenter,
                    )),
              ),
              const Positioned(
                top: 200,
                left: 10,
                child: Text(
                  '',
                  //seriesName,
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
