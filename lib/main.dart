// Base dart shtuff
import 'dart:async';

// Packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// User defined classes
import 'charecter.dart';
import 'charecterStorage.dart';
import 'components/CharacterListItem.dart';
import 'components/ToonCreator.dart';

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
  List<Charecter> toonList;
  final _formKey = GlobalKey<FormState>();



  @override
  void initState() {
    super.initState();
    widget.storage.readAllCharecters().then((List<Charecter> value){
      setState(() {
        toonList = value;
      });
    });
//     widget.storage.readCharecter().then((Charecter value){
//       setState(() {
//         toon = value;
//       });
//     });
  }

  List<Widget> createToonList(List<Charecter> toons)
  {
    List<Widget> toReturn = new List<Widget>();
    for (Charecter item in toons) {
      toReturn.add(CharacterListItem(
        item.info.name, 
        item.info.level, 
        item.info.klass)
      );
    }
    toReturn.add(RaisedButton(
      child: Icon(Icons.add_circle),
      onPressed: _AddCharecter,
      color: Colors.green[400],
      splashColor: Colors.cyan[200],
    ));
    return toReturn;
  }

  Widget listAllToons() {
    return new FutureBuilder<List<Charecter>>(
      future: widget.storage.readAllCharecters(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new ListView(
            padding: new EdgeInsets.all(7.0),
            children: createToonList(toonList),
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
            child: listAllToons(),
          )
        ]
    )
    );
  }  

  Widget _AddCharecter() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return new Scaffold(
        // Appbar
          appBar: new AppBar(
            // Title
            title: new Text("Charecter Creator"),
          ),
          body: new ToonCreation(),
        );
      }
    );
    // return new ToonCreation();  
  }
}

