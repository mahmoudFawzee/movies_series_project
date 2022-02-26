import 'package:flutter/material.dart';

class FaviroteItem extends StatelessWidget {
  final String cover;
  final String name;
  // ignore: use_key_in_widget_constructors
  const FaviroteItem({required this.cover, required this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
        bottom: 10,
        left: 5,
        right: 5,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).colorScheme.secondary.withOpacity(.5)
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(children: [
            SizedBox(
              width: 130,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cover,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ]),
        ),
      ),
    );
  }
}
