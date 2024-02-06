import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:second_task/show_data.dart';

import 'weather_api_mock_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {

  void testWeatherforcity(String city) {
    test('mock test api for pune city', () async {
      final client = MockClient();
      //var cityName = 'pune';
      when(client
          .get(Uri.parse(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$city?unitGroup=metric&key=N6ZGX8GC3DPU4A5NWWJAVURQC&contentType=json')))
          .thenAnswer((_) async =>
          http.Response(
              '{"temperature":23.0,"description":"Mostly sunnny"}', 200));

      final res = await getWeather(city, client);
      expect(res, isA<Map<String, dynamic>>());
    });

  }
  final cities = ['pune', 'satara', 'sangli'];
  for (final city in cities) {
    testWeatherforcity(city);
  }
  /*test('mock test api for satara city', () async {
    final client = MockClient();
    var cityName = 'satara';
    when(client
        .get(Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$cityName?unitGroup=metric&key=N6ZGX8GC3DPU4A5NWWJAVURQC&contentType=json')))
        .thenAnswer((_) async =>
        http.Response(
            '{"temperature":23.0,"description":"Mostly sunnny"}', 200));

    final resSatara = await getWeather(cityName, client);
    expect(resSatara, isA<Map<String, dynamic>>());
  });


  test('mock test api for sangli city', () async {
    final client = MockClient();
    var cityName = 'sangli';
    when(client
        .get(Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$cityName?unitGroup=metric&key=N6ZGX8GC3DPU4A5NWWJAVURQC&contentType=json')))
        .thenAnswer((_) async =>
        http.Response(
            '{"temperature":23.0,"description":"Mostly sunnny"}', 200));

    final resSangli = await getWeather(cityName, client);
    expect(resSangli, isA<Map<String, dynamic>>());
  });

*/
}
