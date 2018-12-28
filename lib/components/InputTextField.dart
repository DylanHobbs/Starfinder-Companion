import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  IconData iconType;
  String labelText;
  Color fillColor;

  InputTextField(this.iconType, this.labelText, this.fillColor);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Icon(this.iconType),
      title: TextField(
        decoration: new InputDecoration(
          labelText: this.labelText,
          fillColor: this.fillColor,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
          ),
        ),
        keyboardType: TextInputType.text,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}