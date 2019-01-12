import 'package:Starbuilder/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

class ThemeDir {
  List<StarbuilderTheme> themeList = [
    StarbuilderTheme(
      'Light Theme',
      ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.deepOrange,
        primaryColor: Colors.cyanAccent,
      )
    ),
    StarbuilderTheme(
      'Dark Theme',
      ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.lightBlueAccent,
        primaryColor: Colors.pink,
      )
    ),

    StarbuilderTheme(
      'Default',
      ThemeData(
        brightness: Brightness.dark,
        primaryColor: Pigment.fromString("0A4859"),
        accentColor: Pigment.fromString("F3C577"),
        primaryColorDark: Pigment.fromString("0A2A30"),
        primaryColorLight: Pigment.fromString("0A4859"),
        buttonColor: Pigment.fromString("C1282A"),

        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )
    ),

    StarbuilderTheme(
      'Munster',
      ThemeData(
        brightness: Brightness.dark,
        primaryColor: Pigment.fromString("#222C58"),
        accentColor: Pigment.fromString("#FADF50"),
        buttonColor: Pigment.fromString("#CF0A2C"),

        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )
    ),
  
    StarbuilderTheme(
      'Munster Alt',
      ThemeData(
        brightness: Brightness.dark,
        primaryColor: Pigment.fromString("#222D58"),
        accentColor: Pigment.fromString("#FADF50"),
        scaffoldBackgroundColor: Pigment.fromString("#CF0A2C"),
        canvasColor: Pigment.fromString("#CF0A2C"),
        cardColor: Pigment.fromString("#222D58"),
        buttonTheme: ButtonThemeData(
          buttonColor: Pigment.fromString("#FADF50"),
          textTheme: ButtonTextTheme.primary,
          splashColor: Pigment.fromString("#CF0A2C"),
          shape: StadiumBorder()
        ),

        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )
    ),

    StarbuilderTheme(
      'Leinster',
      ThemeData(
        brightness: Brightness.dark,
        primaryColor: Pigment.fromString("#EEB111"),
        accentColor: Pigment.fromString("#EFEFEF"),
        scaffoldBackgroundColor: Pigment.fromString("#013A81"),
        // backgroundColor: Pigment.fromString("#013A81"),
        // dialogBackgroundColor: Pigment.fromString("#013A81"),
        canvasColor: Pigment.fromString("#013A81"),
        cardColor: Pigment.fromString("#001734"),
        
        buttonTheme: ButtonThemeData(
          buttonColor: Pigment.fromString("#FADF50"),
          textTheme: ButtonTextTheme.primary,
          splashColor: Pigment.fromString("#CF0A2C"),
          shape: StadiumBorder()
        ),

        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )
    ),

    StarbuilderTheme(
      'Ulster',
      ThemeData(
        brightness: Brightness.dark,
        primaryColor: Pigment.fromString("#000000"),
        accentColor: Pigment.fromString("#EFEFEF"),
        scaffoldBackgroundColor: Pigment.fromString("#EE161F"),
        canvasColor: Pigment.fromString("#EE161F"),
        cardColor: Pigment.fromString("#000000"),
        buttonTheme: ButtonThemeData(
          buttonColor: Pigment.fromString("#FADF50"),
          textTheme: ButtonTextTheme.primary,
          splashColor: Pigment.fromString("#CF0A2C"),
          shape: StadiumBorder()
        ),

        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )
    ),

    StarbuilderTheme(
      'Connacht',
      ThemeData(
        brightness: Brightness.dark,
        primaryColor: Pigment.fromString("#0052A4"),
        accentColor: Pigment.fromString("#EFEFEF"),
        scaffoldBackgroundColor: Pigment.fromString("#078B5C"),
        canvasColor: Pigment.fromString("#078B5C"),
        cardColor: Pigment.fromString("#0052A4"),
        buttonTheme: ButtonThemeData(
          buttonColor: Pigment.fromString("#FADF50"),
          textTheme: ButtonTextTheme.primary,
          splashColor: Pigment.fromString("#CF0A2C"),
          shape: StadiumBorder()
        ),

        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      )
    )


  ];
}
class ThemeList extends StatelessWidget {
  final ThemeDir dir = ThemeDir();
  final ThemeBloc themeBloc;

  ThemeList(this.themeBloc);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dir.themeList.length,
      itemBuilder: (BuildContext context, int index){
        StarbuilderTheme current = dir.themeList[index];
        return new ListTile(
          title: Text(current.name),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor, size: 30.0),
          onTap: () {
            themeBloc.selectedTheme.add(dir.themeList[index]);
          },
        );
      }
    );
  }
}