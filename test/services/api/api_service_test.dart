import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/api/api_service.dart';
import 'dart:convert';

import 'mock_data.dart';

class MockClient extends Mock implements http.Client {}

main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    locator.allowReassignment = true;
  });

  final String url =
      "https://raw.githubusercontent.com/shashiben/luffy/master/timetable.json";

  final headers = {"Accept": "application/json"};
  final fetchUrl = Uri.encodeFull(url);

  group('Fetch data Using API', () {
    test('Constructing Service should find correct dependencies', () {
      final client = MockClient();
      locator.registerSingleton<Client>(client);
      final apiService = locator<APIService>();
      expect(apiService != null, true);
    });

    test('returns data if the http call completes successfully', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      final client = MockClient();
      when(client.get(Uri.parse(fetchUrl), headers: headers))
          .thenAnswer((_) async => http.Response(responseString, 200));

      locator.registerSingleton<Client>(client);

      JsonDecoder _decoder = new JsonDecoder();
      var result = _decoder.convert(responseString);

      final apiService = locator<APIService>();

      expect(await apiService.fetchData(url: fetchUrl), result);
    });

    test('throws an exception if the http call completes with an error', () {
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      final client = MockClient();
      when(client.get(Uri.parse(fetchUrl), headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      locator.registerSingleton<Client>(client);

      final apiService = locator<APIService>();
      expect(apiService.fetchData(url: url), throwsException);
    });
  });
}
