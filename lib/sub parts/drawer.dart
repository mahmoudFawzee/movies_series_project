import 'package:flutter/material.dart';
import 'package:netflex_project/my_app_theme.dart';
import 'package:netflex_project/screens/downloads.dart';
import 'package:netflex_project/screens/favirote.dart';
import 'package:netflex_project/sub%20parts/settings.dart';

import 'down_tab_bar.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  static const double sizedboxHeight = 10.0;

  void goToPage(BuildContext ctx, String nextPageRoute) {
    Navigator.pop(ctx);
    Navigator.of(ctx).pushNamed(nextPageRoute);
  }
  void goToHomePage(BuildContext ctx) {
    Navigator.of(ctx)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const MyTabBar()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 50,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFfbeaff)),
                      ),
                      child: Icon(
                        currentTheme.currntTheme == ThemeMode.dark
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        currentTheme.toggleTheme();
                      },
                    ),
                    Text(currentTheme.currentThemeName),
                  ],
                ),
              ),
              const SizedBox(
                height: sizedboxHeight,
              ),
              drawerObject(Icons.home, 'Home', () => goToHomePage(context)),
              const SizedBox(
                height: sizedboxHeight,
              ),
              drawerObject(Icons.star, 'favirotes',
                  () => goToPage(context, Favirotes.pageRoute)),
              const SizedBox(
                height: sizedboxHeight,
              ),
              drawerObject(Icons.download_done, 'downloads',
                  () => goToPage(context, Downloads.pageRoute)),
              const SizedBox(
                height: sizedboxHeight,
              ),
              drawerObject(Icons.settings, 'settings',
                  () => goToPage(context, Settings.pageRoute)),
              const SizedBox(
                height: sizedboxHeight,
              ),
              drawerObject(Icons.feedback, 'rate us', () {}),
              const SizedBox(
                height: sizedboxHeight,
              ),
              drawerObject(Icons.error, 'about me', () {}),
            ],
          ),
        ),
      ),
    );
  }

  Container drawerObject(IconData icon, String title, onTabMethod) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        onTap: onTabMethod,
        leading: Icon(
          icon,
          // ignore: deprecated_member_use
          color: Theme.of(context).appBarTheme.color,
        ),
        title: Text(title),
      ),
    );
  }
}
