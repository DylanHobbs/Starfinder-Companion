import 'package:flutter/material.dart';
import 'package:Starbuilder/components/Inputs/DropDownField.dart';
import 'package:Starbuilder/components/Inputs/InputTextField.dart';

class CharacterOverview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.all(10.0),
      shrinkWrap: true,
      children: <Widget>[
        InputTextField(Icons.person, "Name", Colors.cyanAccent),
        InputTextField(Icons.description, "Description", Colors.cyanAccent),
        DropdownField(Icons.label, "Race"),
        DropdownField(Icons.label, "Class"),
        DropdownField(Icons.format_paint, "Theme"),
      ],
    );
  }
}