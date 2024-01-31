import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:second_task/show_data.dart';

import 'weather_api_mock_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('mock test api for pune city', () async {
    final client = MockClient();
    var cityName = 'pune';
    when(client
        .get(Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$cityName?unitGroup=metric&key=N6ZGX8GC3DPU4A5NWWJAVURQC&contentType=json')))
        .thenAnswer((_) async =>
        http.Response(
            '{"temperature":23.0,"description":"Mostly sunnny"}', 200));

    final res = await getWeather(cityName, client);
    expect(res, isA<Map<String, dynamic>>());
  });

  test('mock test api for satara city', () async {
    final client = MockClient();
    var cityName = 'satara';
    when(client
        .get(Uri.parse(
        'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$cityName?unitGroup=metric&key=N6ZGX8GC3DPU4A5NWWJAVURQC&contentType=json')))
        .thenAnswer((_) async =>
        http.Response(
            '{"temperature":23.0,"description":"Mostly sunnny"}', 200));

    final res_satara = await getWeather(cityName, client);
    expect(res_satara, isA<Map<String, dynamic>>());
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

    final res_sangli = await getWeather(cityName, client);
    expect(res_sangli, isA<Map<String, dynamic>>());
  });


}
