import "package:flutter/material.dart";

import "dart:math";

class Roll extends StatefulWidget {
  _RollState createState() => _RollState();
}

class _RollState extends State<Roll> {
  final _rnd = new Random();
  List<String> abilityList = [
    "Strength",
    "Dexterity",
    "Constitution",
    "Intelligence",
    "Wisdom",
    "Charisma"
  ];

  Map<String, int> _scores = {
    "Str": 10,
    "Dex": 10,
    "Con": 10,
    "Int": 10,
    "Wis": 10,
    "Cha": 10,
  };

  void _rollScores() {
    setState(() {
      _scores.forEach((score, value) {
        // Generate 4d6 rolls
        // NextInt generates a number in the range
        // [0, arg), so add 1 to fix the value
        List randScores = [
          _rnd.nextInt(6) + 1,
          _rnd.nextInt(6) + 1,
          _rnd.nextInt(6) + 1,
          _rnd.nextInt(6) + 1,
        ];
        // Sort from smallest to largest and drop the smallest element
        randScores.sort();
        randScores.removeAt(0);
        int newScore = randScores.reduce((first, second) => first + second);
        _scores[score] = newScore;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {},),
                    title: new Text("Strength: ${_scores["Str"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {},),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {},),
                    title: new Text("Dexterity: ${_scores["Dex"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {},),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {},),
                    title: new Text("Constitution: ${_scores["Con"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {},),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {},),
                    title: new Text("Intelligence: ${_scores["Int"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {},),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {},),
                    title: new Text("Wisdom: ${_scores["Wis"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {},),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {},),
                    title: new Text("Charisma: ${_scores["Cha"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () {},),
                  ),
                ],
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: _rollScores,
                child: new Text("Roll!"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
