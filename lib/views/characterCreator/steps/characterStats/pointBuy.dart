import 'package:flutter/material.dart';

const int _TOTAL_POINTS = 10;
const int _POINT_FLOOR = 3;
const int _POINT_CEILING = 18;

class PointBuy extends StatefulWidget {
  _PointBuyState createState() => _PointBuyState();
}

class _PointBuyState extends State<PointBuy> {
  int _currentPoints = _TOTAL_POINTS;
  Map<String, int> _scores = {
    "Str": 10,
    "Dex": 10,
    "Con": 10,
    "Int": 10,
    "Wis": 10,
    "Cha": 10,
  };

  void _addScore(score) {
    setState(() {
      if (_scores[score] < _POINT_CEILING) {
        _scores[score]++;
        _currentPoints--;
      }
    });
  }

  void _subScore(score) {
    setState(() {
      if (_scores[score] > _POINT_FLOOR) {
        _scores[score]--;
        _currentPoints++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Points Remaining: ${_currentPoints}"),
          new ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              // Strength
              new ListTile(
                dense: true,
                leading: new IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: (() {
                      _addScore("Str");
                    })),
                title: new Text("Strength: ${_scores["Str"]}"),
                trailing: new IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: (() {
                      _subScore("Str");
                    })),
              ),
              // Dexterity
              new ListTile(
                dense: true,
                leading: new IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: (() {
                      _addScore("Dex");
                    })),
                title: new Text("Dexterity: ${_scores["Dex"]}"),
                trailing: new IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: (() {
                      _subScore("Dex");
                    })),
              ),
              // Constitution
              new ListTile(
                dense: true,
                leading: new IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: (() {
                      _addScore("Con");
                    })),
                title: new Text("Constitution: ${_scores["Con"]}"),
                trailing: new IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: (() {
                      _subScore("Con");
                    })),
              ),
              // Intelligence
              new ListTile(
                dense: true,
                leading: new IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: (() {
                      _addScore("Int");
                    })),
                title: new Text("Intelligence: ${_scores["Int"]}"),
                trailing: new IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: (() {
                      _subScore("Int");
                    })),
              ),
              // Wisdom
              new ListTile(
                dense: true,
                leading: new IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: (() {
                      _addScore("Wis");
                    })),
                title: new Text("wisdom: ${_scores["Wis"]}"),
                trailing: new IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: (() {
                      _subScore("Wis");
                    })),
              ),
              // Charisma
              new ListTile(
                dense: true,
                leading: new IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: (() {
                      _addScore("Cha");
                    })),
                title: new Text("Charisma: ${_scores["Cha"]}"),
                trailing: new IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: (() {
                      _subScore("Cha");
                    })),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
