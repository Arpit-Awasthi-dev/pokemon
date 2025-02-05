import 'package:get/get.dart';
import 'package:pokemon/core/utils/api_status.dart';
import 'package:pokemon/core/utils/mixin_errors.dart';

import '../../core/utils/mixin_status.dart';
import '../../models/pokemon/pokemon_list.dart';
import '../../repositories/pokemon_repo.dart';

class PokemonListPageViewModel extends GetxController
    with ViewModelStatus, ViewModelErrors {
  final _repository = PokemonRepo();
  final _pokemonList = PokemonList();

  PokemonList get pokemonList => _pokemonList;

  void _setPokemonList(PokemonList value) {
    _pokemonList.list.addAll(value.list);
    _pokemonList.hasNextPage = value.hasNextPage;
  }

  void getPokemonList(int page) {
    try {
      _repository.getPokemonList(page).then((success) {
        setStatus(ApiStatus.success);
        _setPokemonList(success);
      });
    } catch (e) {
      setError(e.toString());
      setStatus(ApiStatus.error);
    }
  }
}
