import 'package:flutter/material.dart';

class InputNumberField extends StatelessWidget {
  IconData iconType;
  String labelText;
  Color fillColor;
  Function onsaved;
  var initalValue;


  InputNumberField(
    this.iconType,
    this.labelText,
    this.fillColor,
    this.onsaved,
    this.initalValue
  );

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      dense: true,
      title: TextFormField(
        initialValue: initalValue.toString(),
        onSaved: onsaved,
        decoration: new InputDecoration(
          //hintText: this.labelText,
          labelText: "${this.labelText}:",
          fillColor: this.fillColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          border: new UnderlineInputBorder(
            borderRadius: new BorderRadius.horizontal(),
            borderSide: new BorderSide(
                color: Theme.of(context).accentColor,
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