import 'package:pokemon/core/utils/api_urls.dart';
import 'package:pokemon/models/pokemon/pokemon_list.dart';

import '../core/network/api_services.dart';

class PokemonRepo {
  final _apiServices = ApiServices();

  Future<PokemonList> getPokemonList(int page) async {
    var requestParams = {
      'page': page.toString(),
      'pageSize': '10',
    };

    final response =
        await _apiServices.getApi(ApiUrls.getPokemonList, requestParams);
    return PokemonList.fromJson(response);
  }
}
