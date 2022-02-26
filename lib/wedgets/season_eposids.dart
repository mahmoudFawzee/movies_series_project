import 'package:flutter/material.dart';
import 'package:netflex_project/screens/watching_screen_series.dart';

class OneSeriesEposids extends StatelessWidget {
  final String cover;
  final String seriesName;
  final int eposideNumber;
  final int seasonNum;
  final int id;
  // ignore: use_key_in_widget_constructors
  const OneSeriesEposids({
    required this.eposideNumber,
    required this.seriesName,
    required this.cover,
    required this.seasonNum,
    required this.id,
  });
  nextPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(WatchAndDownloadSeries.pageRoute, arguments: {
      'cover': cover,
      'name': seriesName,
      'epId': eposideNumber,
      'seasonNum':seasonNum,
      'id': id,
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
                ).withOpacity(.6),
                const Color(
                  0xFFF5CEC7,
                ).withOpacity(.1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        cover,
                        width: 220,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(.5),
                        Colors.black.withOpacity(.0)
                      ],
                      begin: Alignment.center,
                      end: Alignment.topCenter,
                    )),
              ),
              Positioned(
                  top: 200,
                  left: 10,
                  child: Column(
                    children: [
                      Text(
                        seriesName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'eposid : $eposideNumber',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
