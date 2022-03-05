import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currntTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  String get currentThemeName => _isDarkTheme ? 'dark' : 'light';

  static ThemeData get containerTheme {
    if (currentTheme.currentThemeName == 'dark') {
      return ThemeData(
        backgroundColor: const Color(0xFF693e41),
      );
    }
    return ThemeData(
      backgroundColor: const Color(0xFF909D43),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
        tabBarTheme: const TabBarTheme(
          indicator: BoxDecoration(
            color: Color(0xFFDBF9D8),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFFb18083)),
        )),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFF3EED9),
          //backgroundColor: Color(0xFFD5585B),
          //backgroundColor: Color(0xFFFFE5DB),
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        primaryIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        primaryColor: const Color(0xFFFE7C7C),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF000000),
          primary: Colors.orange[50],
        ),
        backgroundColor: const Color(0xFFFE7C7C),
        //backgroundColor: const Color(0xFF8CB789),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
          ),
          headline2: TextStyle(
            color: Colors.black,
          ),
          headline3: TextStyle(
            color: Colors.black,
          ),
          headline4: TextStyle(
            color: Colors.black,
          ),
          headline5: TextStyle(
            color: Colors.black,
          ),
          headline6: TextStyle(
            color: Colors.black,
          ),
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF9E6E71),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFfbeaff),
        )),
        primaryColor: const Color(0xFF693e41),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFFFFFFFF),
          primary: const Color(0xFF9E6E71),
        ),
        backgroundColor: const Color(0xFF693e41),
        scaffoldBackgroundColor: Colors.black87,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
          ),
          headline2: TextStyle(
            color: Colors.white,
          ),
          headline3: TextStyle(
            color: Colors.white,
          ),
          headline4: TextStyle(
            color: Colors.white,
          ),
          headline5: TextStyle(
            color: Colors.white,
          ),
          headline6: TextStyle(
            color: Colors.white,
          ),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white, fontSize: 25),
        ));
  }
}
