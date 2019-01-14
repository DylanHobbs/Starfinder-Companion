import 'package:Starbuilder/theme/theme_list.dart';
import 'package:flutter/material.dart';
import 'package:Starbuilder/theme/themes.dart';
import 'package:pigment/pigment.dart';

class ThemeSelectorPage extends StatelessWidget {
  final ThemeBloc themeBloc;

  ThemeSelectorPage({Key key, this.themeBloc}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Picker"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ThemeList(this.themeBloc)
          )
        ),
    );
  }

}