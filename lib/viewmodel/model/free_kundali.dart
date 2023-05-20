class FreeKundaliModel {
  NakshatraDetails? nakshatraDetails;
  MangalDosha? mangalDosha;
  List<YogaDetails>? yogaDetails;

  FreeKundaliModel({this.nakshatraDetails, this.mangalDosha, this.yogaDetails});

  FreeKundaliModel.fromJson(Map<String, dynamic> json) {
    nakshatraDetails = json['nakshatra_details'] != null
        ? NakshatraDetails.fromJson(json['nakshatra_details'])
        : null;
    mangalDosha = json['mangal_dosha'] != null
        ? MangalDosha.fromJson(json['mangal_dosha'])
        : null;
    if (json['yoga_details'] != null) {
      yogaDetails = <YogaDetails>[];
      json['yoga_details'].forEach((v) {
        yogaDetails!.add(YogaDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (nakshatraDetails != null) {
      data['nakshatra_details'] = nakshatraDetails!.toJson();
    }
    if (mangalDosha != null) {
      data['mangal_dosha'] = mangalDosha!.toJson();
    }
    if (yogaDetails != null) {
      data['yoga_details'] = yogaDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NakshatraDetails {
  Nakshatra? nakshatra;
  ChandraRasi? chandraRasi;
  ChandraRasi? sooryaRasi;
  Zodiac? zodiac;
  AdditionalInfo? additionalInfo;

  NakshatraDetails(
      {this.nakshatra,
      this.chandraRasi,
      this.sooryaRasi,
      this.zodiac,
      this.additionalInfo});

  NakshatraDetails.fromJson(Map<String, dynamic> json) {
    nakshatra = json['nakshatra'] != null
        ? Nakshatra.fromJson(json['nakshatra'])
        : null;
    chandraRasi = json['chandra_rasi'] != null
        ? ChandraRasi.fromJson(json['chandra_rasi'])
        : null;
    sooryaRasi = json['soorya_rasi'] != null
        ? ChandraRasi.fromJson(json['soorya_rasi'])
        : null;
    zodiac = json['zodiac'] != null ? Zodiac.fromJson(json['zodiac']) : null;
    additionalInfo = json['additional_info'] != null
        ? AdditionalInfo.fromJson(json['additional_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (nakshatra != null) {
      data['nakshatra'] = nakshatra!.toJson();
    }
    if (chandraRasi != null) {
      data['chandra_rasi'] = chandraRasi!.toJson();
    }
    if (sooryaRasi != null) {
      data['soorya_rasi'] = sooryaRasi!.toJson();
    }
    if (zodiac != null) {
      data['zodiac'] = zodiac!.toJson();
    }
    if (additionalInfo != null) {
      data['additional_info'] = additionalInfo!.toJson();
    }
    return data;
  }
}

class Nakshatra {
  int? id;
  String? name;
  Lord? lord;
  int? pada;

  Nakshatra({this.id, this.name, this.lord, this.pada});

  Nakshatra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lord = json['lord'] != null ? Lord.fromJson(json['lord']) : null;
    pada = json['pada'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (lord != null) {
      data['lord'] = lord!.toJson();
    }
    data['pada'] = pada;
    return data;
  }
}

class Lord {
  int? id;
  String? name;
  String? vedicName;

  Lord({this.id, this.name, this.vedicName});

  Lord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vedicName = json['vedic_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['vedic_name'] = vedicName;
    return data;
  }
}

class ChandraRasi {
  int? id;
  String? name;
  Lord? lord;

  ChandraRasi({this.id, this.name, this.lord});

  ChandraRasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lord = json['lord'] != null ? Lord.fromJson(json['lord']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (lord != null) {
      data['lord'] = lord!.toJson();
    }
    return data;
  }
}

class Zodiac {
  int? id;
  String? name;

  Zodiac({this.id, this.name});

  Zodiac.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class AdditionalInfo {
  String? deity;
  String? ganam;
  String? symbol;
  String? animalSign;
  String? nadi;
  String? color;
  String? bestDirection;
  String? syllables;
  String? birthStone;
  String? gender;
  String? planet;
  String? enemyYoni;

  AdditionalInfo(
      {this.deity,
      this.ganam,
      this.symbol,
      this.animalSign,
      this.nadi,
      this.color,
      this.bestDirection,
      this.syllables,
      this.birthStone,
      this.gender,
      this.planet,
      this.enemyYoni});

  AdditionalInfo.fromJson(Map<String, dynamic> json) {
    deity = json['deity'];
    ganam = json['ganam'];
    symbol = json['symbol'];
    animalSign = json['animal_sign'];
    nadi = json['nadi'];
    color = json['color'];
    bestDirection = json['best_direction'];
    syllables = json['syllables'];
    birthStone = json['birth_stone'];
    gender = json['gender'];
    planet = json['planet'];
    enemyYoni = json['enemy_yoni'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deity'] = deity;
    data['ganam'] = ganam;
    data['symbol'] = symbol;
    data['animal_sign'] = animalSign;
    data['nadi'] = nadi;
    data['color'] = color;
    data['best_direction'] = bestDirection;
    data['syllables'] = syllables;
    data['birth_stone'] = birthStone;
    data['gender'] = gender;
    data['planet'] = planet;
    data['enemy_yoni'] = enemyYoni;
    return data;
  }
}

class MangalDosha {
  bool? hasDosha;
  String? description;

  MangalDosha({this.hasDosha, this.description});

  MangalDosha.fromJson(Map<String, dynamic> json) {
    hasDosha = json['has_dosha'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['has_dosha'] = hasDosha;
    data['description'] = description;
    return data;
  }
}

class YogaDetails {
  String? name;
  String? description;

  YogaDetails({this.name, this.description});

  YogaDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
