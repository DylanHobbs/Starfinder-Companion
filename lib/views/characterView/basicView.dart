import 'package:Starbuilder/components/CurveClipper.dart';
import 'package:Starbuilder/components/StarLoader.dart';
import 'package:Starbuilder/database/CharacterBloc.dart';
import 'package:Starbuilder/models/toon.dart';
import 'package:Starbuilder/theme/themes.dart';
import 'package:Starbuilder/views/characterListView/characterListView.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicView extends StatefulWidget {
  final String name;
  final ThemeBloc themeBloc;
  BasicView({Key key, this.name, this.themeBloc}) : super(key: key);
  @override
  _BasicViewState createState() => _BasicViewState(name, themeBloc);
}

class _BasicViewState extends State<BasicView> {
  final bloc = CharacterBloc();
  final themeBloc;
  Character toon;
  String name;
  double _imageHeight = 250.0;
  double _appBarHeight = 50.0;
  double cardSize = 280.0;
  int currentIndex = 0;
  ScrollController _controller;

  _BasicViewState(this.name, this.themeBloc);

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bloc.fetchOneToon("Borris", "Bardbarion", 1);
    return Material(
      child: StreamBuilder(
        stream: bloc.toons,
        builder: (context, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            return showToon(snapshot, this.themeBloc);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return StarLoader();
        },
      ),
    );
  }

    /*
    Main Container
    Responsible for selecting charecter and bringing components together
    Including all animation
  */
  Widget showToon(AsyncSnapshot<List<Character>> snapshot, themeBloc) {
    ThemeBloc _themeBloc = themeBloc; 
    List<Character> toons = snapshot.data;
    for (var toon in toons) {
      if (toon.name == name) {
        this.toon = toon;
      }
    }
    return Scaffold(
        drawer: Drawer(child: ToonList(themeBloc: this.themeBloc), elevation: 20,),
        bottomNavigationBar: _buildBottomNavBar(),
        body: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            SliverAppBar(
              brightness: Theme.of(context).brightness,
              forceElevated: true,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0.0,
              title: Text('${toon.name} | Level ${toon.level} | ${toon.klass}',
                  style: TextStyle(color: Colors.white)),
              iconTheme: IconThemeData(color: Colors.white),
              expandedHeight: _imageHeight + _appBarHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    _buildMainRect(),
                    _buildBasicInfoScreen(),
                  ],
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: cardSize,
              delegate: SliverChildListDelegate(
                [
                  _buildEmptyCard("Information Card"),
                  _buildEmptyCard("Spells Card"),
                  _buildEmptyCard("Combat Card"),
                  _buildEmptyCard("Roleplay Card"),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildEmptyCard(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: 200,
        height: 100,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Center(child: Text(text, style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor),)),
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
      currentIndex: currentIndex, 
      /*
        The navbar type of shifting is actually better
        but it doesn't seem to allow any colour change. 
      */
      // type: BottomNavigationBarType.shifting,
      type: BottomNavigationBarType.fixed,
      fixedColor: Theme.of(context).accentColor,
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
    /*
      Scrolling is managed here. When we use different card sizes for each card
      we'll need some logic based on the index here. For now it's just fixed
    */
    _controller.animateTo((index) * cardSize * 1.5,
        duration: new Duration(seconds: 1), curve: Curves.ease);
  }

  /*
    Responsible for building the curved container
  */
  _buildMainRect() {
    return ClipPath(
      clipper: CurveClipper(),
      child: new Container(
        height: _imageHeight + _appBarHeight,
        decoration: BoxDecoration(
          boxShadow: const [BoxShadow(blurRadius: 25)],
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }

  _buildLittleCircle(String label, double size, int value) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(value.toString(), style: TextStyle(fontSize: size)),
          Text("KAC", style: TextStyle(fontSize: size / 3)),
        ],
      )),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor, width: 2.0),
          shape: BoxShape.circle),
    );
  }

  _buildHPCircle() {
    return Container(
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
          border: Border.all(color: Theme.of(context).accentColor, width: 2.0),
          shape: BoxShape.circle),
    );
  }

  _buildStatsBlock() {
    return Padding(
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
    );
  }
  /*
    Contains the basic info that will scroll up.
    TODO: Stop scroll before stats go off screen.
    Info here: https://medium.com/flutter-io/slivers-demystified-6ff68ab0296f
  */
  _buildBasicInfoScreen() {
    return new Padding(
      padding: new EdgeInsets.only(
          left: 30, right: 30, top: _appBarHeight + 30, bottom: 15),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLittleCircle("KAC", 20, toon.kac),
              _buildHPCircle(),
              _buildLittleCircle("EAC", 20, toon.eac),
            ],
          ),
          _buildStatsBlock()
        ],
      ),
    );
  }
}
