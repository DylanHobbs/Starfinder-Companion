import 'package:flutter/material.dart';

class CharacterListItem extends StatelessWidget {
  String name, characterClass;
  int level;

  CharacterListItem(this.name, this.level, this.characterClass);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(name),
        subtitle: Text("Level ${level} ${characterClass}"),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () { return null; },
          color: Colors.red,
        ),
      ),
    );
  }
}