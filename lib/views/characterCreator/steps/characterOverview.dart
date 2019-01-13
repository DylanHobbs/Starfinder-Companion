import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/views/characterCreator/ToonCreator.dart';
import 'package:flutter/material.dart';
import 'package:Starbuilder/components/Inputs/DropDownField.dart';
import 'package:Starbuilder/components/Inputs/InputTextField.dart';

class CharacterOverview extends StatelessWidget {
  GlobalKey<FormState> myKey;
  CharacterOverview(this.myKey);

  @override
  Widget build(BuildContext context) {
    final Character charState = FormData.of(context).data;
    return Form(
      key: myKey,
      child: new ListView(
        padding: new EdgeInsets.all(10.0),
        shrinkWrap: true,
        children: <Widget>[
          InputTextField(Icons.person, "Name", Colors.cyanAccent, (value) {
            charState.name = value;
          }, charState.name),
          InputTextField(Icons.description, "Description", Colors.cyanAccent,
              (value) {
            charState.klass = value;
          }, charState.klass),
          DropdownField(Icons.label, "Race"),
          DropdownField(Icons.label, "Class"),
          DropdownField(Icons.format_paint, "Theme"),
        ],
      ),
    );
  }
}
