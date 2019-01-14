import 'dart:math';

import 'package:flutter/material.dart';
import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/components/CharacterListItem.dart';
import 'package:Starbuilder/components/StarLoader.dart';

class ToonList extends StatefulWidget {
  @override
  ToonListState createState() {
    return new ToonListState();
  }
}

class ToonListState extends State<ToonList> {
  final bloc = CharacterBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
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
          return Dismissible(
            child: CharacterListItem(item.name, item.level, item.klass),
            key: UniqueKey(),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Confirm Delete"),
                    content: new Text("Are you sure you want to perma-kill this dood?"),
                    actions: <Widget>[
                      ButtonBar(
                        // mainAxisSize: MainAxisSize.max,
                        alignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0))),
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
                          borderRadius: BorderRadius.all(Radius.circular(32.0))),
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
