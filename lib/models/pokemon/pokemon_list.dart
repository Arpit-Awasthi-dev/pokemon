import 'package:get/get.dart';

import 'pokemon.dart';

class PokemonList {
  List<Pokemon> list = List<Pokemon>.empty(growable: true).obs;
  bool hasNextPage = false;

  PokemonList();

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    return PokemonList()
      ..list =
          (json['data'] as List).map((item) => Pokemon.fromJson(item)).toList()
      ..hasNextPage = (json['page'] * 10) < json['totalCount'];
  }
}
