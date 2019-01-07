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

  void _moveElementDown(idx) {
    setState(() {
      String current = abilityList[idx];
      abilityList[idx] = abilityList[(idx+1)%abilityList.length];
      abilityList[(idx+1)%abilityList.length] = current;
    });
  }

  void _moveElementUp(idx) {
    setState(() {
      String current = abilityList[idx];
      abilityList[idx] = abilityList[(idx-1)%abilityList.length];
      abilityList[(idx-1)%abilityList.length] = current;
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
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () { _moveElementUp(0); },),
                    title: new Text("${abilityList[0]}: ${_scores["Str"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () { _moveElementDown(0); },),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () { _moveElementUp(1); },),
                    title: new Text("${abilityList[1]}: ${_scores["Dex"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () { _moveElementDown(1); },),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () { _moveElementUp(2); },),
                    title: new Text("${abilityList[2]}: ${_scores["Con"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () { _moveElementDown(2); },),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () { _moveElementUp(3); },),
                    title: new Text("${abilityList[3]}: ${_scores["Int"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () { _moveElementDown(3); },),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () { _moveElementUp(4); },),
                    title: new Text("${abilityList[4]}: ${_scores["Wis"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () { _moveElementDown(4); },),
                  ),
                  new ListTile(
                    dense: true,
                    leading: new IconButton(icon: Icon(Icons.arrow_upward), onPressed: () { _moveElementUp(5); },),
                    title: new Text("${abilityList[5]}: ${_scores["Cha"]}", textAlign: TextAlign.center,),
                    trailing: new IconButton(icon: Icon(Icons.arrow_downward), onPressed: () { _moveElementDown(5); },),
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
