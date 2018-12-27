// Base dart shtuff
import 'dart:async';

// Packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// User defined classes
import 'charecter.dart';
import 'charecterStorage.dart';

/*
  Main function.
  Overall themes are defined here as well as starting point and material 
  widgets. (navigation, app bar ect)
*/
void main() {
  runApp(new MaterialApp(
    title: "Statfinder Companion",
    theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.dark,
        primaryColor: Colors.cyan[200],
        accentColor: Colors.cyan[600],

        // Define the default Font Family
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
        ),
      ),
    home: Scaffold(
        appBar: AppBar(
          title: Text('Starfinder Companion'),
        ),
        body: Center(
          child: Starfinder(storage: CharecterStorage()),
        )
    )
  ));
}

class Starfinder extends StatefulWidget {
  final CharecterStorage storage;
  Starfinder({Key key, @required this.storage}) : super(key: key);

  @override
  StarfinderState createState() => new StarfinderState();
}

class StarfinderState extends State<Starfinder> {
  List data;
  Charecter toon;

  @override
  void initState() {
    super.initState();
    widget.storage.readCharecter().then((Charecter value){
        setState(() {
          toon = value;      
        });
    });
  }


  Widget toonData() {
    return new FutureBuilder<Charecter>(
      future: widget.storage.readCharecter(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: TextField(
                  decoration: new InputDecoration(
                    labelText: "Name:",
                    fillColor: Colors.cyanAccent,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                ),
              ListTile(
                leading: Icon(Icons.description),
                title: TextField(
                  decoration: new InputDecoration(
                    labelText: "Description:",
                    fillColor: Colors.cyanAccent,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                ),
              ListTile(
                leading: Icon(Icons.label),
                title: TextField(
                  decoration: new InputDecoration(
                    labelText: "Class:",
                    fillColor: Colors.cyanAccent,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                ),
              ListTile(
                leading: Icon(Icons.format_paint),
                title: TextField(
                  decoration: new InputDecoration(
                    labelText: "Theme:",
                    fillColor: Colors.cyanAccent,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                ),
              // ListTile(
              //   leading: Icon(Icons.format_paint),
              //   title: Text("Theme: " + (snapshot.data.info.theme)),
              // ),
            ],
          );
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }
        return new CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
    child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Flexible(
            child: toonData(),
          )
        ]
    )
    );
  }
}

Future<String> _loadChar() async {
  return await rootBundle.loadString('toon_repo/data.json');
}

Future loadChar() async {
  String toon = await _loadChar();
  return toon;
}