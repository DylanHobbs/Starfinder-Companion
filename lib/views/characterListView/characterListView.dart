import 'dart:math';

import 'package:Starbuilder/theme/theme_selector.dart';
import 'package:Starbuilder/theme/themes.dart';
import 'package:Starbuilder/views/characterView/basicView.dart';
import 'package:flutter/material.dart';
import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/components/CharacterListItem.dart';
import 'package:Starbuilder/components/StarLoader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToonList extends StatefulWidget {
  ThemeBloc themeBloc;
  ToonList({Key key, this.themeBloc}) : super(key: key);
  @override
  ToonListState createState() {
    return new ToonListState(themeBloc);
  }
}

class ToonListState extends State<ToonList> {
  final bloc = CharacterBloc();
  final themeBloc;

  ToonListState(this.themeBloc);

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  setSharedPrefs(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('selected', true);
    await prefs.setString('selectedName', name);
    print("Set: " + name);
  }

  @override
  Widget build(BuildContext context) {
    // bloc.fetchOneToon("Borris", "Bardbarion", 1);
    return Material(
      child: StreamBuilder(
        stream: bloc.toons,
        builder: (context, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return StarLoader();
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Character>> snapshot) {
    // Create the list
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          Character item = snapshot.data[index];
          if (index == 0) {
            return DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Your Charecters", style: TextStyle(fontSize: 26)),
                      IconButton(
                        icon: Icon(
                          Icons.format_paint,
                        ),
                        tooltip: 'Theme selector',
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ThemeSelectorPage(
                                    themeBloc: this.themeBloc,
                                  )));
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("You made these", style: TextStyle(fontSize: 15))
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
            );
          }
          index -= 1;
          return Dismissible(
            child: CharacterListItem(item.name, item.level, item.klass, () {
              // Set the saved preference for this charecter
              setSharedPrefs(item.name);
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BasicView(
                        name: item.name,
                        themeBloc: themeBloc,
                      )));
            }),
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Confirm Delete"),
                    content: new Text(
                        "Are you sure you want to perma-kill this dood?"),
                    actions: <Widget>[
                      ButtonBar(
                        // mainAxisSize: MainAxisSize.max,
                        alignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0))),
                            color: Colors.green,
                            child: new Text("Revive!"),
                            onPressed: () {
                              // Animatied "phew" coming out of button
                              bloc.getToons();
                              Navigator.of(context).pop();
                            },
                          ),
                          new RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0))),
                            color: Colors.red,
                            child: new Text("Murder!"),
                            onPressed: () {
                              bloc.delete(item.id);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            },
          );
        });
  }
}
