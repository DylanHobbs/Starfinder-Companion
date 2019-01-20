import 'dart:math';

import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/theme/theme_selector.dart';
import 'package:Starbuilder/theme/themes.dart';
import 'package:Starbuilder/views/characterCreator/ToonCreator.dart';
import 'package:Starbuilder/views/characterListView/characterListView.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  final ThemeBloc themeBloc;
  const HomePage({Key key, this.themeBloc}) : super(key: key);

  @override
  HomePageState createState() {
    return new HomePageState(themeBloc);
  }
}

class HomePageState extends State<HomePage> {
  final bloc = CharacterBloc();
  final themeBloc;
  HomePageState(this.themeBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          title: Text('Starfinder Companion'),
          actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.settings,
                  ),
                  tooltip: 'Theme selector',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ThemeSelectorPage(
                              themeBloc: this.themeBloc,
                        )
                    ));
                  },
                ),
              ],
        ),
        drawer: Drawer(child: ToonList(themeBloc: this.themeBloc,)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ToonCreation(bloc)));
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