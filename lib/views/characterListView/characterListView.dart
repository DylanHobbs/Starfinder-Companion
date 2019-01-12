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
  void dispose(){
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
          // This is a real hackey way to add something to 
          // the builder. Don't judge me too harshly.
          // if(index == 0){
          //   return DrawerHeader(
          //     child: Text("Your Characters"),
          //     decoration: BoxDecoration(
          //       color: Colors.cyan[200],
          //     ),
          //   );
          // }
          // index--;
          Character item = snapshot.data[index];
          return Dismissible(
                    child: CharacterListItem(item.name, item.level, item.klass), 
                    key: UniqueKey(),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                      bloc.delete(item.id);
                    },
                  ); 
        });
  }
}