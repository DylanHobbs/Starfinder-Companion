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
    int speed;
    String race;
    String theme;
    String klass;
    int level;
    int xp;
    String description;
    String languages;
    String allignment;
    int money;
    int currentHp;
    int eac;
    int kac;
    String keyAbility;
    int carryingCap;
    int acrobatics;
    int athletics;
    int bluff;
    int computers;
    int culture;
    int diplomacy;
    int disguise;
    int engineering;
    int intimidate;
    int lifeScience;
    int medicine;
    int mysticism;
    int perception;
    int physicalScience;
    int piloting;
    int profession;
    int senseMotive;
    int sleightOfHand;
    int stealth;
    int survival;
    int strength;
    int dexterity;
    int constitution;
    int intelligence;
    int wisdom;
    int charisma;

    Character({
        this.id,
        this.name,
        this.speed,
        this.race,
        this.theme,
        this.klass,
        this.level,
        this.xp,
        this.description,
        this.languages,
        this.allignment,
        this.money,
        this.currentHp,
        this.eac,
        this.kac,
        this.keyAbility,
        this.carryingCap,
        this.acrobatics,
        this.athletics,
        this.bluff,
        this.computers,
        this.culture,
        this.diplomacy,
        this.disguise,
        this.engineering,
        this.intimidate,
        this.lifeScience,
        this.medicine,
        this.mysticism,
        this.perception,
        this.physicalScience,
        this.piloting,
        this.profession,
        this.senseMotive,
        this.sleightOfHand,
        this.stealth,
        this.survival,
        this.strength,
        this.dexterity,
        this.constitution,
        this.intelligence,
        this.wisdom,
        this.charisma,
    });

    factory Character.fromJson(Map<String, dynamic> json) => new Character(
        id: json["id"],
        name: json["name"],
        speed: json["speed"],
        race: json["race"],
        theme: json["theme"],
        klass: json["klass"],
        level: json["level"],
        xp: json["xp"],
        description: json["description"],
        languages: json["languages"],
        allignment: json["allignment"],
        money: json["money"],
        currentHp: json["currentHP"],
        eac: json["EAC"],
        kac: json["KAC"],
        keyAbility: json["keyAbility"],
        carryingCap: json["carrying_cap"],
        acrobatics: json["Acrobatics"],
        athletics: json["Athletics"],
        bluff: json["Bluff"],
        computers: json["Computers"],
        culture: json["Culture"],
        diplomacy: json["Diplomacy"],
        disguise: json["Disguise"],
        engineering: json["Engineering"],
        intimidate: json["Intimidate"],
        lifeScience: json["Life_Science"],
        medicine: json["Medicine"],
        mysticism: json["Mysticism"],
        perception: json["Perception"],
        physicalScience: json["Physical_Science"],
        piloting: json["Piloting"],
        profession: json["Profession"],
        senseMotive: json["Sense_Motive"],
        sleightOfHand: json["Sleight_of_Hand"],
        stealth: json["Stealth"],
        survival: json["Survival"],
        strength: json["Strength"],
        dexterity: json["Dexterity"],
        constitution: json["Constitution"],
        intelligence: json["Intelligence"],
        wisdom: json["Wisdom"],
        charisma: json["Charisma"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "speed": speed,
        "race": race,
        "theme": theme,
        "klass": klass,
        "level": level,
        "xp": xp,
        "description": description,
        "languages": languages,
        "allignment": allignment,
        "money": money,
        "currentHP": currentHp,
        "EAC": eac,
        "KAC": kac,
        "keyAbility": keyAbility,
        "carrying_cap": carryingCap,
        "Acrobatics": acrobatics,
        "Athletics": athletics,
        "Bluff": bluff,
        "Computers": computers,
        "Culture": culture,
        "Diplomacy": diplomacy,
        "Disguise": disguise,
        "Engineering": engineering,
        "Intimidate": intimidate,
        "Life_Science": lifeScience,
        "Medicine": medicine,
        "Mysticism": mysticism,
        "Perception": perception,
        "Physical_Science": physicalScience,
        "Piloting": piloting,
        "Profession": profession,
        "Sense_Motive": senseMotive,
        "Sleight_of_Hand": sleightOfHand,
        "Stealth": stealth,
        "Survival": survival,
        "Strength": strength,
        "Dexterity": dexterity,
        "Constitution": constitution,
        "Intelligence": intelligence,
        "Wisdom": wisdom,
        "Charisma": charisma,
    };
}
