// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'pages/home_page.dart';
// import 'pages/weather_provider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => WeatherProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Weather App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const HomePage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/pages/service.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    BlocProvider(
        create: (context) {
          return WeatherCubit(WeatherService());
        },
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
