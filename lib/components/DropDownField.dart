import 'package:flutter/material.dart';

const classes = <String>["Soldier", "Envoy", "Solaran"];

class DropdownField extends StatefulWidget {
  final IconData iconType;
  final String hint;

  const DropdownField(
      this.iconType,
      this.hint,
      {Key key}): super(key: key);

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  // Initial value for the dropdown menu
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Icon(widget.iconType),
      trailing: DropdownButton(
        value: this.dropDownValue,
        hint: Text(widget.hint),
        onChanged: (String update) {
          setState(() {
            dropDownValue = update;
          });
        },
        items: classes.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        style: new TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
        ),
      ),
    );
  }
}