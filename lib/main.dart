// Packages
import 'package:flutter/material.dart';
import 'dart:math';

// User defined classes
import 'package:Starbuilder/views/characterCreator/ToonCreator.dart';
import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/views/characterListView/characterListView.dart';

/*
  Main function.
  Overall themes are defined here as well as starting point and material 
  widgets. (navigation, app bar ect)
*/
void main() {
  runApp(new MaterialApp(
      title: "Statfinder Companion",
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan[200],
        accentColor: Colors.cyan[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
        ),
      ),
      home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final bloc = CharacterBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starfinder Companion'),
      ),
      drawer: Drawer(child: ToonList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ToonCreation()));
        },
        child: Icon(Icons.add),
      ),
      body: new Material(
          child: Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text("Welcome to Starbuilder!"),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: RaisedButton(
                    onPressed: () {
                      var rng = new Random();
                      Character rnd = Character.fromJson({
                        "id": rng.nextInt(150),
                        "name": "Test",
                        "klass": "Boomer",
                        "level": 5,
                        "race": "Baller"
                      });
                      bloc.add(rnd);
                    },
                    child: new Text("Add a Test Character!")),
              )
            ]),
      )),
    );
  }
}
