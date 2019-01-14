import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pigment/pigment.dart';

class StarbuilderTheme{
  final String name;
  final ThemeData data;

  const StarbuilderTheme(this.name, this.data);
}

class ThemeBloc {
  final Stream<ThemeData> themeDataStream;
  final Sink<StarbuilderTheme> selectedTheme;

  factory ThemeBloc(){
    final selectedTheme = PublishSubject<StarbuilderTheme>();
    final themeDataStream = selectedTheme
      .distinct()
      .map((theme) => theme.data);
    return ThemeBloc._(themeDataStream, selectedTheme);
  }

  const ThemeBloc._(this.themeDataStream, this.selectedTheme);

  StarbuilderTheme defaultTheme(){
    return StarbuilderTheme(
      'default',
      ThemeData(
        brightness: Brightness.dark,
        primaryColor: Pigment.fromString("0A4859"),
        accentColor: Pigment.fromString("F3C577"),
        primaryColorDark: Pigment.fromString("0A2A30"),
        primaryColorLight: Pigment.fromString("0A4859"),
        buttonColor: Pigment.fromString("CF0A2C"),

        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )
    );
  }

}