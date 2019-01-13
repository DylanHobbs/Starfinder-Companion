import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/views/characterCreator/ToonCreator.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  IconData iconType;
  String labelText;
  Color fillColor;
  Function onsaved;
  var initalValue;
  
  InputTextField(this.iconType, this.labelText, this.fillColor, this.onsaved, this.initalValue);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: TextFormField(
        initialValue: initalValue,
        decoration: new InputDecoration(
          //hintText: this.labelText,
          labelText: "${this.labelText}:",
          fillColor: this.fillColor,
          border: new UnderlineInputBorder(
            borderRadius: new BorderRadius.horizontal(),
            borderSide: new BorderSide(color: Theme.of(context).accentColor, width: 1.0, style: BorderStyle.solid),
          ),
//          border: new OutlineInputBorder(
//            borderRadius: new BorderRadius.circular(25.0),
//          ),
        ),
        keyboardType: TextInputType.text,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
        onSaved: onsaved
      ),
    );
  }
}