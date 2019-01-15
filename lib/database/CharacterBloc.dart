import 'dart:async';

import 'package:Starbuilder/database/database.dart';
import 'package:Starbuilder/models/toon.dart';

class CharacterBloc {
  CharacterBloc(){
    getToons();
  }

  final _toonController = StreamController<List<Character>>.broadcast();
  get toons => _toonController.stream;

  final _oneToonController = StreamController<Character>.broadcast();
  get oneToon => _oneToonController.stream;

  dispose(){
    _toonController.close();
    _oneToonController.close();
  }

  getToons() async {
    _toonController.sink.add(await DBProvider.db.getAllToons());
  }

  getToon(String name) async {
    _oneToonController.sink.add(await DBProvider.db.getToonFromName(name));
  }

  update(Character toon) {
    DBProvider.db.updateToon(toon);
    getToons();
  }

  delete(int id) {
    DBProvider.db.deleteToon(id);
    getToons();
  }

  add(Character toon) {
    DBProvider.db.newToon(toon);
    getToons();
  }

}