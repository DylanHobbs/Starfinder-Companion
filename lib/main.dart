import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'charecter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(storage: CounterStorage()),
    ),
  );
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final file = File('$path/toon_test_3.json');
    bool exists = file.existsSync();
    if(exists){
      return file;
    } else {
      // Load the default file
      final newfile = await getFileData('toonRepo/data.json');
      return file.writeAsString(newfile);
    }
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If we encounter an error, return 0
      return 0;
    }
  }

  Future<Charecter> readCharecter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      Map charecterMap = jsonDecode(contents);
      Charecter toon = Charecter.fromJson(charecterMap);
      return toon;
    } catch (e) {
      throw new Exception("There was an error loading your toon");
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  final CounterStorage storage;

  FlutterDemo({Key key, @required this.storage}) : super(key: key);

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter;
  Charecter toon;

  @override
  void initState() {
    super.initState();
    // widget.storage.readCounter().then((int value) {
    //   setState(() {
    //     _counter = value;
    //   });
    // });
    widget.storage.getFileData('toonRepo/data.json').then((f) => print(f));
    // widget.storage.readCharecter().then((Charecter value){
    //     setState(() {
    //       toon = value;          
    //     });
    // });
  }

  Future<File> _incrementCounter() async {
    setState(() {
      _counter++;
    });

    // write the variable as a string to the file
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files')),
      body: Center(
        child: ListView.builder(
          // Build the ListView
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Text("Name: " + (toon?.info?.name ?? 'foo')),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}