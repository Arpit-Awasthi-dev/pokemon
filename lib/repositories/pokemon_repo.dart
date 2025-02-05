import 'package:pokemon/core/utils/api_urls.dart';
import 'package:pokemon/models/pokemon/pokemon_list.dart';

import '../core/network/api_services.dart';

class PokemonRepo {
  final _apiServices = ApiServices();

  Future<PokemonList> getPokemonList(int page, String? query) async {
    var requestParams = {
      if (query == null) 'page': page.toString(),
      if (query == null) 'pageSize': '10',
      if (query != null) 'q': 'set.name:$query'
    };

    final response =
        await _apiServices.getApi(ApiUrls.getPokemonList, requestParams);
    return PokemonList.fromJson(response);
  }
}
