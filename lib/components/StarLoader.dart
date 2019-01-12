import 'dart:math';

import 'package:flutter/material.dart';

class StarLoader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Text(getRandomMessage())
              ],
            )
          )
    );
  }

  String getRandomMessage(){
    final random = new Random();
    return this.messages[random.nextInt(this.messages.length)];
  }

  final List<String> messages = [
      "Hunting for bugs...",
      "Rolling initiative...",
      "Charging the door...",
      "Getting things together...",
      "Making a death save...",
      "Reloding laser...",
      "Purgeing the aft injector port...",
      "Disengaging the ventral tachyon ray...",
    ];
}