import 'package:flutter/material.dart';
import 'package:netflex_project/screens/category_films.dart';
import 'package:netflex_project/screens/category_series.dart';
import 'package:netflex_project/sub%20parts/drawer.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  List<Widget> myWidgets = const [
    FilmsCategory(),
    SeriesCategory(),
  ];
  int _selectedScreenIndex = 0;
  void _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modo film',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).backgroundColor
            ])),
          ),
          myWidgets[_selectedScreenIndex],
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        child: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedIconTheme: const IconThemeData(size: 25),
          currentIndex: _selectedScreenIndex,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          items: [
            bottomNavigationBarItem(Icons.videocam_sharp, 'films'),
            bottomNavigationBarItem(Icons.tv, 'series')
          ],
          onTap: _selectedScreen,
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(
      IconData iconData, String label) {
    return BottomNavigationBarItem(icon: Icon(iconData), label: label);
  }
}
