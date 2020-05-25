import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';

@lazySingleton
class APIService {
  final http.Client client = locator<http.Client>();

  fetchData({String url}) async {
    final fetchUrl = Uri.encodeFull(url);
    final headers = {"Accept": "application/json"};

    final response = await client.get(fetchUrl, headers: headers);

    if (response?.statusCode != 200) {
      throw Exception("Error While Retrieving Data from Url");
    }

    JsonDecoder _decoder = new JsonDecoder();

    return _decoder.convert(response.body);
  }
}
