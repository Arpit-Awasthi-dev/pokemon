import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:pokemon/core/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/core/utils/api_urls.dart';
import 'package:pokemon/core/utils/exceptions.dart';
import 'package:pokemon/localization/locale_keys.dart';

class ApiServices extends BaseApiService {
  @override
  Future<Map<String, dynamic>> getApi(
    String url,
    Map<String, String>? queryParams,
  ) async {
    try {
      var queryArr = [];
      if (queryParams != null) {
        var keys = queryParams.keys.toList();
        for (int i = 0; i < keys.length; i++) {
          queryArr.add('${keys[i]}=${queryParams[keys[i]]}');
        }
      }

      var queryString = '?${queryArr.join('&')}';

      log(queryString);

      var uri =
          Uri.parse('${ApiUrls.baseUrl}${ApiUrls.version}$url$queryString');

      log(uri.toString());
      final response = await http.get(uri).timeout(
            const Duration(seconds: 10),
          );

      var json = _checkResponse(response);

      log(json.toString());
      return json;
    } on SocketException {
      throw InternetException();
    } on RequestTimeoutException {
      throw RequestTimeoutException();
    }
  }

  dynamic _checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);

      /// todo - handle diff status codes
      default:
        throw CustomExceptions(
          '${Localized.somethingWentWrong} : ${response.statusCode}',
        );
    }
  }
}
