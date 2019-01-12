import 'dart:async';

import 'package:Starbuilder/database/database.dart';
import 'package:Starbuilder/models/toon.dart';

class CharacterBloc {
  CharacterBloc(){
    getToons();
  }

  final _toonController = StreamController<List<Character>>.broadcast();
  get toons => _toonController.stream;

  dispose(){
    _toonController.close();
  }

  getToons() async {
    _toonController.sink.add(await DBProvider.db.getAllToons());
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