import 'package:flutter/material.dart';
import 'package:Starbuilder/views/characterCreator/steps/characterStats/custom.dart';
import 'package:Starbuilder/views/characterCreator/steps/characterStats/pointBuy.dart';
import 'package:Starbuilder/views/characterCreator/steps/characterStats/roll.dart';

class CharacterStats extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _CharacterStatsState();
  }
}

class _CharacterStatsState extends State<CharacterStats> {
  static Widget _custom = new Custom();
  int _allocationType = 0;
  Widget _view = new Container(
    padding: EdgeInsets.all(20),
    child: _custom,
  );

  void _handleViewChange(int value) {
    setState(() {
      _allocationType = value;
      switch(value) {
        case 0: {
          _view = new Custom();
        } break;

        case 1: {
          _view = new Container(
            padding: EdgeInsets.all(20),
            child: new PointBuy(),
          );
        } break;

        case 2: {
          _view = new Container(
            padding: EdgeInsets.all(20),
            child: Roll(),
          );
        } break;

        default: {
          _view = new Container(
            padding: EdgeInsets.all(20),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(10),
      // TODO: change this to be a Column containing a row containing
      // the radio button columns, and then the variable view. Also find
      // a "default" value for the _view value
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _allocationType,
                    onChanged: _handleViewChange,
                  ),
                  Text(
                    "Custom",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Radio(
                    value: 1,
                    groupValue: _allocationType,
                    onChanged: _handleViewChange,
                  ),
                  Text(
                    "Point Buy",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Radio(
                    value: 2,
                    groupValue: _allocationType,
                    onChanged: _handleViewChange,
                  ),
                  Text(
                    "Roll",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          _view,
        ],
      ),
    );
  }
}