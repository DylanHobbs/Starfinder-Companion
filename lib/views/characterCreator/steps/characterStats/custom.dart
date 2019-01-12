import 'package:flutter/material.dart';
import 'package:Starbuilder/components/Inputs/InputNumberField.dart';

class Custom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new ListView(
            padding: new EdgeInsets.all(10.0),
            shrinkWrap: true,
            children: <Widget>[
              new InputNumberField(null, "Strength", Colors.cyanAccent),
              new InputNumberField(null, "Dexterity", Colors.cyanAccent),
              new InputNumberField(null, "Constitution", Colors.cyanAccent),
              new InputNumberField(null, "Intelligence", Colors.cyanAccent),
              new InputNumberField(null, "Wisdom", Colors.cyanAccent),
              new InputNumberField(null, "Charisma", Colors.cyanAccent),
            ],
          ),
        ],
      ),
    );
  }
}