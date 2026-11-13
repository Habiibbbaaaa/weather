// import 'package:flutter/material.dart';
// import 'service.dart';
// import 'model.dart';

// class WeatherProvider extends ChangeNotifier {
//   WeatherModel? weather; // هنخزن فيها بيانات الطقس

//   Future<void> getWeather(String cityName) async {
//     try {
//       // نجيب بيانات الطقس من السيرفيس
//       final service = WeatherService();
//       weather = await service.getWeather(cityName);

//       // نقول لكل الصفحات اللي بتسمع "فيه بيانات جديدة"
//       notifyListeners();
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
// }
