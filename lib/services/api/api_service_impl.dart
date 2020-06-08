import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'api_service.dart';

@Singleton(as: APIService)
class APIServiceImpl implements APIService {
  final http.Client _client;

  // For testing
  const APIServiceImpl(this._client);

  @override
  Future fetchData({String url}) async {
    final fetchUrl = Uri.encodeFull(url);
    final headers = {"Accept": "application/json"};

    final response = await _client.get(fetchUrl, headers: headers);

    if (response?.statusCode != 200) {
      throw Exception("Error While Retrieving Data from Url");
    }

    JsonDecoder _decoder = new JsonDecoder();

    return _decoder.convert(response.body);
  }
}
