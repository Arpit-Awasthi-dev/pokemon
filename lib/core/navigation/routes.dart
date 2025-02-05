import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/navigation/named_routes.dart';

import '../../presentation/view/pokemon_detail_page.dart';
import '../../presentation/view/pokemon_list_page.dart';

class Routes {
  static List<GetPage> appRoutes() => [
        _getPage(
          name: NamedRoutes.pokemonListPage,
          page: const PokemonListPage(),
        ),
        _getPage(
          name: NamedRoutes.pokemonDetailPage,
          page: const PokemonDetailPage(),
        ),
      ];
}

_getPage({required String name, required Widget page}) {
  return GetPage(
    name: name,
    page: () => page,
    transitionDuration: const Duration(milliseconds: 200),
    transition: Transition.rightToLeft,
  );
}
