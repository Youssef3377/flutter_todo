import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  final Elements elmt;
  final Function delete;

  const Article({required this.elmt, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Icon(Icons.checklist),
          title: Text(this.elmt.name),
          subtitle: Text(this.elmt.desc),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              this.delete;
            },
          )),
    );
  }
}

class Elements {
  final String name;
  final String desc;
  Elements({required this.name, required this.desc});
}
