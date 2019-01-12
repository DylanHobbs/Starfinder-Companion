import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  IconData iconType;
  String labelText;
  Color fillColor;

  InputTextField(this.iconType, this.labelText, this.fillColor);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: TextFormField(
        decoration: new InputDecoration(
          //hintText: this.labelText,
          labelText: "${this.labelText}:",
          fillColor: this.fillColor,
          border: new UnderlineInputBorder(
            borderRadius: new BorderRadius.horizontal(),
            borderSide: new BorderSide(color: Colors.cyanAccent, width: 1.0, style: BorderStyle.solid),
          ),
//          border: new OutlineInputBorder(
//            borderRadius: new BorderRadius.circular(25.0),
//          ),
        ),
        keyboardType: TextInputType.text,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}