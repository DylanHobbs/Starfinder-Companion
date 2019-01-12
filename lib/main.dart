// Packages
import 'package:Starbuilder/theme/themes.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() { 
    super.initState();
    _themeBloc = ThemeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      stream: _themeBloc.themeDataStream,
      initialData: _themeBloc.defaultTheme().data,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot){
        return MaterialApp(
          title: "Boomfa Rugby",
          theme: snapshot.data,
          home: HomePage(
            themeBloc: _themeBloc,
          ),
        );
      },
    );
  }
}

