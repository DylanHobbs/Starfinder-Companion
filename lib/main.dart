// Packages
import 'package:Starbuilder/theme/theme_list.dart';
import 'package:Starbuilder/theme/themes.dart';
import 'package:Starbuilder/views/characterView/basicView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// User defined classes
import 'package:Starbuilder/views/home.dart';

/*
  Main function.
  Overall themes are defined here as well as starting point and material 
  widgets. (navigation, app bar ect)
*/
void main() => runApp(Starbuilder());

/*
  Starbuilder has been extrapolated to here to maintain the dynamic theme data
*/
class Starbuilder extends StatefulWidget {
  @override
  _StarbuilderState createState() => _StarbuilderState();
}

class _StarbuilderState extends State<Starbuilder> {
  ThemeBloc _themeBloc;
  StarbuilderTheme initalTheme;
  bool charecterSelected = false;
  String selectedCharecterName;

  Future<Null> getSharedPrefs() async {
    ThemeDir dir = ThemeDir();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Persistant themes
      String theme = prefs.getString('theme') ?? "Default";
      this.initalTheme = dir.getThemeByName(theme);

      // // Persistant Charecters
      if (prefs.getString('selectedName') != null) {
        this.selectedCharecterName = prefs.getString('selectedName');
        this.charecterSelected = true;
      }
    });
  }

  @override
  initState() {
    getSharedPrefs();
    super.initState();
    _themeBloc = ThemeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      stream: _themeBloc.themeDataStream,
      initialData: this.initalTheme.data,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Starbuilder",
            theme: snapshot.data,
            home: decideOnPage());
      },
    );
  }

  decideOnPage() {
    if (this.charecterSelected) {
      return BasicView(
        name: this.selectedCharecterName,
        themeBloc: _themeBloc,
      );
    } else {
      return HomePage(themeBloc: _themeBloc);
    }
  }
}
