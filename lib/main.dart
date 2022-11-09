import 'package:flutter/material.dart';
import 'package:projettodo/article.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String val = "Bonjour";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  int i = 1;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<Elements> elements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste De Tache"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.brown[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 480,
              child: ListView.builder(
                itemCount: elements.length,
                itemBuilder: (context, i) {
                  final element = elements[i];
                  return Article(
                    elmt: element,
                    delete: () {
                      print("supression ");
                      setState(() {
                        elements.removeAt(i);
                      });
                    },
                  );
                },
                shrinkWrap: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: nameController,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: descController,
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Elements elmt = new Elements(
              name: nameController.text, desc: descController.text);
          setState(() {
            print("Ajouter un element");
            elements.add(elmt);
          });
        },
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      ),
    );
  }
}
