import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'api_url.dart' as api;

class BaseHelper {
  Future<dynamic> get(String url) async {
    var responseJson;
    final response = await http.get(api.url + url);
    responseJson = _returnResponse(response);

    return responseJson;
  }

  Future<dynamic> post(String url, Object object) async {
    var responseJson;

    final response = await http.post( api.url + url,body: object, );
    print(response);
    responseJson = _returnResponse(response);

    return response;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());

        print(responseJson);

        return responseJson;
      case 400:
        throw (response.body.toString());
      case 401:

      case 403:
        throw (response.body.toString());
      case 500:
      default:
        throw (response.body.toString());
    }
  }
}
