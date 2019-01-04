import 'package:flutter/material.dart';

class InputNumberField extends StatelessWidget {
  IconData iconType;
  String labelText;
  Color fillColor;

  InputNumberField(
    this.iconType,
    this.labelText,
    this.fillColor
  );

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      dense: true,
      title: TextFormField(
        decoration: new InputDecoration(
          //hintText: this.labelText,
          labelText: "${this.labelText}:",
          fillColor: this.fillColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          border: new UnderlineInputBorder(
            borderRadius: new BorderRadius.horizontal(),
            borderSide: new BorderSide(
                color: Colors.cyanAccent,
                width: 1.0,
                style: BorderStyle.solid
            ),
          ),
        ),
        keyboardType: TextInputType.number,
        style: new TextStyle(
          fontFamily: "Poppins",
          height: 1,
        ),
      ),
    );
  }
}