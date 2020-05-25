import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/services/api_service.dart';
import 'dart:convert';

class MockClient extends Mock implements http.Client {}

main() {
  final String url =
      "https://raw.githubusercontent.com/shashiben/luffy/master/timetable.json";

  final client = MockClient();
  final headers = {"Accept": "application/json"};
  final fetchUrl = Uri.encodeFull(url);

  setUpAll(() {
    setupLocator();
  });

  locator.allowReassignment = true;
  locator.registerSingleton<http.Client>(client);
  final APIService apiService = APIService();

  group('Fetch data Using API', () {
    test('returns data if the http call completes successfully', () async {
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.

      final responseString =
          '[{"class_name": "VHDL Lab" , "start_time": "09:30" , "end_time": "12:30" , "day": "MON" , "year": "first_year" }, {"class_name": "VHDL Lab" , "start_time": "09:30" , "end_time": "12:30" , "day": "MON" , "year": "first_year" }, {"class_name": "VHDL Lab" , "start_time": "09:30" , "end_time": "12:30" , "day": "MON" , "year": "first_year" }]';

      when(client.get(fetchUrl, headers: headers))
          .thenAnswer((_) async => http.Response(responseString, 200));

      JsonDecoder _decoder = new JsonDecoder();
      var result = _decoder.convert(responseString);

      expect(await apiService.fetchData(url: fetchUrl), result);
    });

    test('throws an exception if the http call completes with an error', () {
      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(fetchUrl, headers: headers))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiService.fetchData(url: url), throwsException);
    });
  });
}
