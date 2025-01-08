// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

PokemonCard pokemonCardFromMap(String str) => PokemonCard.fromMap(json.decode(str));

String pokemonCardToMap(PokemonCard data) => json.encode(data.toMap());

class PokemonCard {
  final List<Datum>? data;
  final int? page;
  final int? pageSize;
  final int? count;
  final int? totalCount;

  PokemonCard({
    this.data,
    this.page,
    this.pageSize,
    this.count,
    this.totalCount,
  });

  factory PokemonCard.fromMap(Map<String, dynamic> json) => PokemonCard(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    page: json["page"],
    pageSize: json["pageSize"],
    count: json["count"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "page": page,
    "pageSize": pageSize,
    "count": count,
    "totalCount": totalCount,
  };
}

class Datum {
  final String? id;
  final String? name;
  final String? supertype;
  final List<String>? subtypes;
  final String? level;
  final String? hp;
  final List<String>? types;
  final String? evolvesFrom;
  final List<Ability>? abilities;
  final List<Attack>? attacks;
  final List<Resistance>? weaknesses;
  final List<Resistance>? resistances;
  final List<String>? retreatCost;
  final int? convertedRetreatCost;
  final Set? datumSet;
  final String? number;
  final String? artist;
  final String? rarity;
  final String? flavorText;
  final List<int>? nationalPokedexNumbers;
  final Legalities? legalities;
  final DatumImages? images;
  final Tcgplayer? tcgplayer;
  final Cardmarket? cardmarket;

  Datum({
    this.id,
    this.name,
    this.supertype,
    this.subtypes,
    this.level,
    this.hp,
    this.types,
    this.evolvesFrom,
    this.abilities,
    this.attacks,
    this.weaknesses,
    this.resistances,
    this.retreatCost,
    this.convertedRetreatCost,
    this.datumSet,
    this.number,
    this.artist,
    this.rarity,
    this.flavorText,
    this.nationalPokedexNumbers,
    this.legalities,
    this.images,
    this.tcgplayer,
    this.cardmarket,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    supertype: json["supertype"],
    subtypes: json["subtypes"] == null ? [] : List<String>.from(json["subtypes"]!.map((x) => x)),
    level: json["level"],
    hp: json["hp"],
    types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
    evolvesFrom: json["evolvesFrom"],
    abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromMap(x))),
    attacks: json["attacks"] == null ? [] : List<Attack>.from(json["attacks"]!.map((x) => Attack.fromMap(x))),
    weaknesses: json["weaknesses"] == null ? [] : List<Resistance>.from(json["weaknesses"]!.map((x) => Resistance.fromMap(x))),
    resistances: json["resistances"] == null ? [] : List<Resistance>.from(json["resistances"]!.map((x) => Resistance.fromMap(x))),
    retreatCost: json["retreatCost"] == null ? [] : List<String>.from(json["retreatCost"]!.map((x) => x)),
    convertedRetreatCost: json["convertedRetreatCost"],
    datumSet: json["set"] == null ? null : Set.fromMap(json["set"]),
    number: json["number"],
    artist: json["artist"],
    rarity: json["rarity"],
    flavorText: json["flavorText"],
    nationalPokedexNumbers: json["nationalPokedexNumbers"] == null ? [] : List<int>.from(json["nationalPokedexNumbers"]!.map((x) => x)),
    legalities: json["legalities"] == null ? null : Legalities.fromMap(json["legalities"]),
    images: json["images"] == null ? null : DatumImages.fromMap(json["images"]),
    tcgplayer: json["tcgplayer"] == null ? null : Tcgplayer.fromMap(json["tcgplayer"]),
    cardmarket: json["cardmarket"] == null ? null : Cardmarket.fromMap(json["cardmarket"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "supertype": supertype,
    "subtypes": subtypes == null ? [] : List<dynamic>.from(subtypes!.map((x) => x)),
    "level": level,
    "hp": hp,
    "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
    "evolvesFrom": evolvesFrom,
    "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toMap())),
    "attacks": attacks == null ? [] : List<dynamic>.from(attacks!.map((x) => x.toMap())),
    "weaknesses": weaknesses == null ? [] : List<dynamic>.from(weaknesses!.map((x) => x.toMap())),
    "resistances": resistances == null ? [] : List<dynamic>.from(resistances!.map((x) => x.toMap())),
    "retreatCost": retreatCost == null ? [] : List<dynamic>.from(retreatCost!.map((x) => x)),
    "convertedRetreatCost": convertedRetreatCost,
    "set": datumSet?.toMap(),
    "number": number,
    "artist": artist,
    "rarity": rarity,
    "flavorText": flavorText,
    "nationalPokedexNumbers": nationalPokedexNumbers == null ? [] : List<dynamic>.from(nationalPokedexNumbers!.map((x) => x)),
    "legalities": legalities?.toMap(),
    "images": images?.toMap(),
    "tcgplayer": tcgplayer?.toMap(),
    "cardmarket": cardmarket?.toMap(),
  };
}

class Ability {
  final String? name;
  final String? text;
  final String? type;

  Ability({
    this.name,
    this.text,
    this.type,
  });

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
    name: json["name"],
    text: json["text"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "text": text,
    "type": type,
  };
}

class Attack {
  final String? name;
  final List<String>? cost;
  final int? convertedEnergyCost;
  final String? damage;
  final String? text;

  Attack({
    this.name,
    this.cost,
    this.convertedEnergyCost,
    this.damage,
    this.text,
  });

  factory Attack.fromMap(Map<String, dynamic> json) => Attack(
    name: json["name"],
    cost: json["cost"] == null ? [] : List<String>.from(json["cost"]!.map((x) => x)),
    convertedEnergyCost: json["convertedEnergyCost"],
    damage: json["damage"],
    text: json["text"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "cost": cost == null ? [] : List<dynamic>.from(cost!.map((x) => x)),
    "convertedEnergyCost": convertedEnergyCost,
    "damage": damage,
    "text": text,
  };
}

class Cardmarket {
  final String? url;
  final String? updatedAt;
  final Map<String, double>? prices;

  Cardmarket({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory Cardmarket.fromMap(Map<String, dynamic> json) => Cardmarket(
    url: json["url"],
    updatedAt: json["updatedAt"],
    prices: Map.from(json["prices"]!).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "updatedAt": updatedAt,
    "prices": Map.from(prices!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Set {
  final String? id;
  final String? name;
  final String? series;
  final int? printedTotal;
  final int? total;
  final Legalities? legalities;
  final String? ptcgoCode;
  final String? releaseDate;
  final String? updatedAt;
  final SetImages? images;

  Set({
    this.id,
    this.name,
    this.series,
    this.printedTotal,
    this.total,
    this.legalities,
    this.ptcgoCode,
    this.releaseDate,
    this.updatedAt,
    this.images,
  });

  factory Set.fromMap(Map<String, dynamic> json) => Set(
    id: json["id"],
    name: json["name"],
    series: json["series"],
    printedTotal: json["printedTotal"],
    total: json["total"],
    legalities: json["legalities"] == null ? null : Legalities.fromMap(json["legalities"]),
    ptcgoCode: json["ptcgoCode"],
    releaseDate: json["releaseDate"],
    updatedAt: json["updatedAt"],
    images: json["images"] == null ? null : SetImages.fromMap(json["images"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "series": series,
    "printedTotal": printedTotal,
    "total": total,
    "legalities": legalities?.toMap(),
    "ptcgoCode": ptcgoCode,
    "releaseDate": releaseDate,
    "updatedAt": updatedAt,
    "images": images?.toMap(),
  };
}

class SetImages {
  final String? symbol;
  final String? logo;

  SetImages({
    this.symbol,
    this.logo,
  });

  factory SetImages.fromMap(Map<String, dynamic> json) => SetImages(
    symbol: json["symbol"],
    logo: json["logo"],
  );

  Map<String, dynamic> toMap() => {
    "symbol": symbol,
    "logo": logo,
  };
}

class Legalities {
  final String? unlimited;

  Legalities({
    this.unlimited,
  });

  factory Legalities.fromMap(Map<String, dynamic> json) => Legalities(
    unlimited: json["unlimited"],
  );

  Map<String, dynamic> toMap() => {
    "unlimited": unlimited,
  };
}

class DatumImages {
  final String? small;
  final String? large;

  DatumImages({
    this.small,
    this.large,
  });

  factory DatumImages.fromMap(Map<String, dynamic> json) => DatumImages(
    small: json["small"],
    large: json["large"],
  );

  Map<String, dynamic> toMap() => {
    "small": small,
    "large": large,
  };
}

class Resistance {
  final String? type;
  final String? value;

  Resistance({
    this.type,
    this.value,
  });

  factory Resistance.fromMap(Map<String, dynamic> json) => Resistance(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "value": value,
  };
}

class Tcgplayer {
  final String? url;
  final String? updatedAt;
  final Prices? prices;

  Tcgplayer({
    this.url,
    this.updatedAt,
    this.prices,
  });

  factory Tcgplayer.fromMap(Map<String, dynamic> json) => Tcgplayer(
    url: json["url"],
    updatedAt: json["updatedAt"],
    prices: json["prices"] == null ? null : Prices.fromMap(json["prices"]),
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "updatedAt": updatedAt,
    "prices": prices?.toMap(),
  };
}

class Prices {
  final Holofoil? holofoil;
  final Holofoil? reverseHolofoil;

  Prices({
    this.holofoil,
    this.reverseHolofoil,
  });

  factory Prices.fromMap(Map<String, dynamic> json) => Prices(
    holofoil: json["holofoil"] == null ? null : Holofoil.fromMap(json["holofoil"]),
    reverseHolofoil: json["reverseHolofoil"] == null ? null : Holofoil.fromMap(json["reverseHolofoil"]),
  );

  Map<String, dynamic> toMap() => {
    "holofoil": holofoil?.toMap(),
    "reverseHolofoil": reverseHolofoil?.toMap(),
  };
}

class Holofoil {
  final double? low;
  final double? mid;
  final double? high;
  final double? market;
  final double? directLow;

  Holofoil({
    this.low,
    this.mid,
    this.high,
    this.market,
    this.directLow,
  });

  factory Holofoil.fromMap(Map<String, dynamic> json) => Holofoil(
    low: json["low"]?.toDouble(),
    mid: json["mid"]?.toDouble(),
    high: json["high"]?.toDouble(),
    market: json["market"]?.toDouble(),
    directLow: json["directLow"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "low": low,
    "mid": mid,
    "high": high,
    "market": market,
    "directLow": directLow,
  };
}
