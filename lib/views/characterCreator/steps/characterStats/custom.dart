import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/views/characterCreator/ToonCreator.dart';
import 'package:flutter/material.dart';
import 'package:Starbuilder/components/Inputs/InputNumberField.dart';

class Custom extends StatelessWidget {
  GlobalKey<FormState> myKey;
  Custom(this.myKey);

  @override
  Widget build(BuildContext context) {
    final Character charState = FormData.of(context).data;
    return new Container(
      child: new Column(
        children: <Widget>[
          Form(
            key:myKey,
            child: new ListView(
              padding: new EdgeInsets.all(10.0),
              shrinkWrap: true,
              children: <Widget>[
                new InputNumberField(null, "Strength", Colors.cyanAccent,
                    (value) {
                  charState.strength = int.parse(value);
                }, charState.strength),
                new InputNumberField(null, "Dexterity", Colors.cyanAccent,
                    (value) {
                  charState.dexterity = int.parse(value);
                }, charState.dexterity),
                new InputNumberField(null, "Constitution", Colors.cyanAccent,
                    (value) {
                  charState.constitution = int.parse(value);
                }, charState.constitution),
                new InputNumberField(null, "Intelligence", Colors.cyanAccent,
                    (value) {
                  charState.intelligence = int.parse(value);
                }, charState.intelligence),
                new InputNumberField(null, "Wisdom", Colors.cyanAccent,
                    (value) {
                  charState.wisdom = int.parse(value);
                }, charState.wisdom),
                new InputNumberField(null, "Charisma", Colors.cyanAccent,
                    (value) {
                  charState.charisma = int.parse(value);
                }, charState.charisma),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
