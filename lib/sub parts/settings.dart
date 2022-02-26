import 'package:flutter/material.dart';
import 'package:netflex_project/sub%20parts/drawer.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static const pageRoute = '/settings';

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _darkTheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: ElevatedButton(
          child: Icon(
            _darkTheme ? Icons.dark_mode : Icons.light_mode,
          ),
          onPressed: () {
            setState(
              () {
                _darkTheme = !_darkTheme;
              },
            );
          },
        ),
      ),
    );
  }
}
