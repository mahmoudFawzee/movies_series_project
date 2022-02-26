import 'package:flutter/material.dart';

import 'down_tab_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    _splashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        body: Center(
          child: ClipRRect(
            child: Image.asset(
              'assets/splachScreenLightTheme.jpeg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ));
  }
  
  void _splashScreen() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const MyTabBar()));
  }
}
