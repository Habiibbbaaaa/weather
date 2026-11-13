class WeatherModel {
  final String city;
  final double temp;
  final String condition;

  WeatherModel({
    required this.city,
    required this.temp,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['location'] == null || json['current'] == null) {
      throw Exception("Invalid city name or data not found");
    }

    return WeatherModel(
      city: json['location']['name'],
      temp: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
    );
  }
}
