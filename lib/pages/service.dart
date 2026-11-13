import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

class WeatherService {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '134058a3cf724c678f4200802250810';

  Future<WeatherModel> getWeather(String cityName) async {
    Uri url = Uri.parse('$baseUrl/current.json?key=$apiKey&q=$cityName');

    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }

    var data = jsonDecode(response.body);
    //  هنا مش بيحول هنا بيستدعي التحويل
    // object من weathermodel
    return WeatherModel.fromJson(data);
  }
}
