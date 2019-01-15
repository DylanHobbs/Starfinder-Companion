import 'package:Starbuilder/components/StarLoader.dart';
import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/models/toon.dart';
import 'package:flutter/material.dart';

class BasicView extends StatefulWidget {
  String name;
  BasicView({Key key, this.name}) : super(key: key);
  @override
  _BasicViewState createState() => _BasicViewState(name);
}

class _BasicViewState extends State<BasicView> {
  final bloc = CharacterBloc();
  Character toon;
  String name;
  _BasicViewState(this.name);

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
            return showToon(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return StarLoader();
        },
      ),
    );
  }

  Widget showToon(AsyncSnapshot<List<Character>> snapshot) {
    List<Character> toons = snapshot.data;
    for (var toon in toons) {
      if (toon.name == name) {
        this.toon = toon;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(toon.name + " the " + toon.klass),
      ),
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              gradient: new LinearGradient(
                colors: [Theme.of(context).cardColor, Theme.of(context).canvasColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
              )
            ),
                child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Container(
                          child: Text(
                            toon.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.stars,
                  ),
                  Text(toon.level.toString())
                ],
              ),
            ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              gradient: new LinearGradient(
                colors: [Theme.of(context).cardColor, Theme.of(context).canvasColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
              )
            ),
                  child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildStatColumn(toon.strength.toString(), "Str"),
              _buildStatColumn(toon.wisdom.toString(), "Wis"),
              _buildStatColumn(toon.wisdom.toString(), "Con"),
              _buildStatColumn(toon.intelligence.toString(), "Int"),
              _buildStatColumn(toon.dexterity.toString(), "Dex"),
              _buildStatColumn(toon.charisma.toString(), "Cha"),
            ],
          )
          ),
        )
        
      ]),
    );
  }

  Column _buildStatColumn(String heading, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          heading.toString(),
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
