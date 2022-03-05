import 'package:flutter/material.dart';
import 'package:netflex_project/screens/favirote.dart';

class FaviroteItem extends StatelessWidget {
  final String cover;
  final String name;
  final int id;
  // ignore: use_key_in_widget_constructors
  const FaviroteItem(
      {required this.cover, required this.name, required this.id});

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
          child: Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
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
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () => removeFromFavirotes(Favirotes.favirotesList,id),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void removeFromFavirotes(List faverotes, int id) {
    faverotes.removeAt(id);
  }
}
