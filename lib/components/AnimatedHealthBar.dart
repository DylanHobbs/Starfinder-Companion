import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedHealthBar extends StatefulWidget {
  Color other;
  int currentHP;
  int maxHP;
  AnimatedHealthBar(this.other);

  @override
  _AnimatedHealthBarState createState() {
    return new _AnimatedHealthBarState(other);
  }
}

class _AnimatedHealthBarState extends State<AnimatedHealthBar> {
  Timer _timer;
  Color themeColour;
  Color redColour = Colors.red;
  Color color = Colors.red;
  
  _AnimatedHealthBarState(this.themeColour) {
    const time = const Duration(milliseconds:1000);
    _timer = new Timer.periodic(time, (Timer t){
      setState(() {
        if(this.color == Colors.red){
          this.color = themeColour;
        } else {
          this.color = redColour;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("50", style: TextStyle(fontSize: 35)),
          Text("Current HP", style: TextStyle(fontSize: 12)),
        ],
      )),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: this.color,
          border: Border.all(color: Theme.of(context).accentColor, width: 2.0),
          shape: BoxShape.circle),
    );
  }
}