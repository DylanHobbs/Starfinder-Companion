// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

Character characterFromJson(String str) {
    final jsonData = json.decode(str);
    return Character.fromJson(jsonData);
}

String characterToJson(Character data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Character {
    int id;
    String name;
    String race;
    String klass;
    int level;

    Character( {
        this.id,
        this.name,
        this.race,
        this.klass,
        this.level,
    });

    factory Character.fromJson(Map<String, dynamic> json) => new Character(
        id: json["id"],
        name: json["name"],
        race: json["race"],
        klass: json["klass"],
        level: json["level"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "race": race,
        "klass": klass,
        "level": level,
    };
}
