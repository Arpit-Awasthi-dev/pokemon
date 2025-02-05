/// TODO - deserialization in models
class Pokemon {
  final String id;
  final String name;
  final String supertype;
  final List<String> subtypes;
  final String? hp;
  final List<String> types;
  final String? evolvesFrom;
  final List<Attack> attacks;
  final List<Weakness> weaknesses;
  final List<Resistance> resistances;
  final List<String> retreatCost;
  final int? convertedRetreatCost;
  final CardSet set;
  final String? number;
  final String? artist;
  final String? rarity;
  final String? flavorText;
  final List<int> nationalPokedexNumbers;
  final Legalities legalities;
  final CardImages images;
  final MarketData? tcgplayer;
  final CardMarket? cardmarket;

  Pokemon({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.hp,
    required this.types,
    required this.evolvesFrom,
    required this.attacks,
    required this.weaknesses,
    required this.resistances,
    required this.retreatCost,
    required this.convertedRetreatCost,
    required this.set,
    required this.number,
    required this.artist,
    required this.rarity,
    required this.flavorText,
    required this.nationalPokedexNumbers,
    required this.legalities,
    required this.images,
    required this.tcgplayer,
    required this.cardmarket,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      supertype: json['supertype'],
      subtypes: List<String>.from(json['subtypes']),
      hp: json['hp'],
      types: json['types'] != null ? List<String>.from(json['types']) : [],
      evolvesFrom: json['evolvesFrom'],
      attacks: json['attacks'] != null
          ? List<Attack>.from(json['attacks'].map((x) => Attack.fromJson(x)))
          : [],
      weaknesses: json['weaknesses'] != null
          ? List<Weakness>.from(
              json['weaknesses'].map((x) => Weakness.fromJson(x)))
          : [],
      resistances: json['resistances'] != null
          ? List<Resistance>.from(
              json['resistances'].map((x) => Resistance.fromJson(x)))
          : [],
      retreatCost: json['retreatCost'] != null
          ? List<String>.from(json['retreatCost'])
          : [],
      convertedRetreatCost: json['convertedRetreatCost'],
      set: CardSet.fromJson(json['set']),
      number: json['number'],
      artist: json['artist'],
      rarity: json['rarity'],
      flavorText: json['flavorText'],
      nationalPokedexNumbers: json['nationalPokedexNumbers'] != null
          ? List<int>.from(json['nationalPokedexNumbers'])
          : [],
      legalities: Legalities.fromJson(json['legalities']),
      images: CardImages.fromJson(json['images']),
      tcgplayer: json['tcgplayer'] != null
          ? MarketData.fromJson(json['tcgplayer'])
          : null,
      cardmarket: json['cardmarket'] != null
          ? CardMarket.fromJson(json['cardmarket'])
          : null,
    );
  }
}

class Attack {
  final String name;
  final List<String> cost;
  final int convertedEnergyCost;
  final String damage;
  final String text;

  Attack({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  factory Attack.fromJson(Map<String, dynamic> json) {
    return Attack(
      name: json['name'],
      cost: List<String>.from(json['cost']),
      convertedEnergyCost: json['convertedEnergyCost'],
      damage: json['damage'],
      text: json['text'],
    );
  }
}

class Weakness {
  final String type;
  final String value;

  Weakness({required this.type, required this.value});

  factory Weakness.fromJson(Map<String, dynamic> json) {
    return Weakness(
      type: json['type'],
      value: json['value'],
    );
  }
}

class Resistance {
  final String type;
  final String value;

  Resistance({required this.type, required this.value});

  factory Resistance.fromJson(Map<String, dynamic> json) {
    return Resistance(
      type: json['type'],
      value: json['value'],
    );
  }
}

class CardSet {
  final String id;
  final String name;
  final String series;
  final int printedTotal;
  final int total;
  final Legalities legalities;
  final String? ptcgoCode;
  final String releaseDate;
  final String updatedAt;
  final String logo;

  CardSet({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.logo,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      id: json['id'],
      name: json['name'],
      series: json['series'],
      printedTotal: json['printedTotal'],
      total: json['total'],
      legalities: Legalities.fromJson(json['legalities']),
      ptcgoCode: json['ptcgoCode'],
      releaseDate: json['releaseDate'],
      updatedAt: json['updatedAt'],
      logo: json['images']['symbol'],
    );
  }
}

class Legalities {
  final String unlimited;

  Legalities({required this.unlimited});

  factory Legalities.fromJson(Map<String, dynamic> json) {
    return Legalities(
      unlimited: json['unlimited'],
    );
  }
}

class CardImages {
  final String small;
  final String large;

  CardImages({required this.small, required this.large});

  factory CardImages.fromJson(Map<String, dynamic> json) {
    return CardImages(
      small: json['small'],
      large: json['large'],
    );
  }
}

class MarketData {
  final String url;
  final String updatedAt;
  final Prices? prices;

  MarketData(
      {required this.url, required this.updatedAt, required this.prices});

  factory MarketData.fromJson(Map<String, dynamic> json) {
    return MarketData(
      url: json['url'],
      updatedAt: json['updatedAt'],
      prices: json['prices'] != null ? Prices.fromJson(json['prices']) : null,
    );
  }
}

class Prices {
  final PriceDetails? holofoil;
  final PriceDetails? reverseHolofoil;

  Prices({this.holofoil, this.reverseHolofoil});

  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      holofoil: json['holofoil'] != null
          ? PriceDetails.fromJson(json['holofoil'])
          : null,
      reverseHolofoil: json['reverseHolofoil'] != null
          ? PriceDetails.fromJson(json['reverseHolofoil'])
          : null,
    );
  }
}

class PriceDetails {
  final double? low;
  final double? mid;
  final double? high;
  final double? market;
  final double? directLow;

  PriceDetails({this.low, this.mid, this.high, this.market, this.directLow});

  factory PriceDetails.fromJson(Map<String, dynamic> json) {
    return PriceDetails(
      low: (json['low'] as num?)?.toDouble(),
      mid: (json['mid'] as num?)?.toDouble(),
      high: (json['high'] as num?)?.toDouble(),
      market: (json['market'] as num?)?.toDouble(),
      directLow: (json['directLow'] as num?)?.toDouble(),
    );
  }
}

class CardMarket {
  final double averageSellPrice;
  final double trendPrice;

  CardMarket({
    required this.averageSellPrice,
    required this.trendPrice,
  });

  factory CardMarket.fromJson(Map<String, dynamic> json) {
    return CardMarket(
      averageSellPrice: json['prices']['averageSellPrice'],
      trendPrice: json['prices']['trendPrice'],
    );
  }
}
