import 'package:Starbuilder/components/CurveClipper.dart';
import 'package:Starbuilder/components/StarLoader.dart';
import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/theme/theme_selector.dart';
import 'package:Starbuilder/views/characterListView/characterListView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicView extends StatefulWidget {
  String name;
  BasicView({Key key, this.name}) : super(key: key);
  @override
  _BasicViewState createState() => _BasicViewState(name);
}

class _BasicViewState extends State<BasicView> {
  final bloc = CharacterBloc();
  Character toon;
  String name;
  double _imageHeight = 250.0;
  _BasicViewState(this.name);
  int currentIndex = 0;

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bloc.fetchOneToon("Borris", "Bardbarion", 1);
    return Material(
      child: StreamBuilder(
        stream: bloc.toons,
        builder: (context, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            return showToon(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return StarLoader();
        },
      ),
    );
  }

  Widget _buildEmptyCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 120,
        child: Card(
          child: Center(child: Text("This is a test card")),
        ),
      ),
    );
  }

  Column _buildStatColumn(String heading, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          heading.toString(),
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Colors.white,
            width: 2.0,
          ))),
        ),
      ],
    );
  }

  characterBoxDecoration() {
    return BoxDecoration(
        boxShadow: const [BoxShadow(blurRadius: 15)],
        borderRadius: BorderRadius.all(Radius.circular(35)),
        gradient: new LinearGradient(colors: [
          Theme.of(context).cardColor,
          Theme.of(context).primaryColor
        ], begin: Alignment.centerLeft, end: Alignment.centerRight));
  }

  _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex, // this will be set when a new tab is tapped
      type: BottomNavigationBarType.shifting,
      fixedColor: Theme.of(context).cardColor,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: new Icon(FontAwesomeIcons.user),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(FontAwesomeIcons.hatWizard),
          title: new Text('Spells'),
        ),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.fistRaised), title: Text('Combat')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.theaterMasks),
            title: Text('Role Play')),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  _buildMainRect() {
    return ClipPath(
      clipper: CurveClipper(),
      child: new Container(
        height: _imageHeight,
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 25)],
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }

  _buildBasicInfoScreen() {
    return new Padding(
      padding: new EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("13", style: TextStyle(fontSize: 20)),
                    Text("KAC", style: TextStyle(fontSize: 8)),
                  ],
                )),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    shape: BoxShape.circle),
              ),
              Container(
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
                    border: Border.all(color: Colors.white, width: 2.0),
                    shape: BoxShape.circle),
              ),
              Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("17", style: TextStyle(fontSize: 20)),
                    Text("EAC", style: TextStyle(fontSize: 8)),
                  ],
                )),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0),
                    shape: BoxShape.circle),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
            child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildStatColumn(toon.strength.toString(), "Str"),
                    _buildStatColumn(toon.wisdom.toString(), "Wis"),
                    _buildStatColumn(toon.wisdom.toString(), "Con"),
                    _buildStatColumn(toon.intelligence.toString(), "Int"),
                    _buildStatColumn(toon.dexterity.toString(), "Dex"),
                    _buildStatColumn(toon.charisma.toString(), "Cha"),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildListBody() {
    return new Expanded(
    child: new ListView(
      children: <Widget>[
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
        _buildEmptyCard(),
      ],
    ),
  );
  }

  Widget _buildMyTasksHeader() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
              new Text(
                'Character Stuff',
                style: new TextStyle(fontSize: 34.0),
              ),
      ],
    ),
  );
}

Widget _buildBottomPart() {
  return new Padding(
    padding: new EdgeInsets.only(top: _imageHeight),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildMyTasksHeader(),
        _buildListBody(),
      ],
    ),
  );
}

  Widget showToon(AsyncSnapshot<List<Character>> snapshot) {
    List<Character> toons = snapshot.data;
    for (var toon in toons) {
      if (toon.name == name) {
        this.toon = toon;
      }
    }
    return Scaffold(
      drawer: Drawer(child: ToonList()),
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('${toon.name} | Level ${toon.level} | ${toon.klass}',
            style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      body: new Stack(
        children: <Widget>[
          _buildMainRect(),
          _buildBasicInfoScreen(),
          _buildBottomPart(),
        ],
      ),
    );
  }
}
//   return Scaffold(
//     body:
//         Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
//       Padding(
//         padding:
//             const EdgeInsets.only(left: 8.0, right: 8, top: 15, bottom: 15),
//         child: Container(
//           padding: const EdgeInsets.all(25),
//           decoration: characterBoxDecoration(),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Name",
//                       style: TextStyle(color: Colors.grey[500]),
//                     ),
//                     Container(
//                       child: Text(
//                         toon.name,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 30),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Icon(
//                 Icons.stars,
//               ),
//               Text(
//                 toon.level.toString(),
//                 style: TextStyle(fontSize: 20),
//               )
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
//         child: Container(
//           decoration: characterBoxDecoration(),
//           child: Padding(
//               padding: const EdgeInsets.only(top: 30, bottom: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   _buildStatColumn(toon.strength.toString(), "Str"),
//                   _buildStatColumn(toon.wisdom.toString(), "Wis"),
//                   _buildStatColumn(toon.wisdom.toString(), "Con"),
//                   _buildStatColumn(toon.intelligence.toString(), "Int"),
//                   _buildStatColumn(toon.dexterity.toString(), "Dex"),
//                   _buildStatColumn(toon.charisma.toString(), "Cha"),
//                 ],
//               )),
//         ),
//       )
//     ]),
//   );
// }

// Widget LittleBox({child: const Text("Empty")}){
//   return Container(
//     child: child,
//     decoration: BoxDecoration(
//       border: Border.all(),
//     ),
//   );
// }
