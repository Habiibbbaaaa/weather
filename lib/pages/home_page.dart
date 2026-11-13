// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'search.dart';
// import 'weather_provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<WeatherProvider>(context);

//     final weather = provider.weather;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weather App'),
//         backgroundColor: Color.fromARGB(255, 225, 167, 30),
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('images/wallpaper.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: const Icon(Icons.search),
//               onPressed: () async {
//                 // نفتح صفحة البحث ونستقبل النتيجة
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => SearchPage()),
//                 );

//                 // لما نرجع من صفحة البحث، نجيب الطقس للمدينة
//                 if (result != null && result.isNotEmpty) {
//                   // provider.getWeather(result);

//                   Provider.of<WeatherProvider>(context, listen: false)
//                       .getWeather(result);
//                 }
//               },
//             ),
//             Text(
//               weather != null ? weather!.city : 'No city selected',
//               style: const TextStyle(color: Colors.white, fontSize: 40),
//             ),
//             Text(
//               weather != null ? '${weather!.temp}°C' : '--°C',
//               style: const TextStyle(color: Colors.white, fontSize: 70),
//             ),
//             Text(
//               weather != null ? weather!.condition : 'Condition',
//               style: const TextStyle(color: Colors.white, fontSize: 30),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/pages/model.dart';
import 'search.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  HomePage({super.key});
  @override
  // backgrounds functions
  String getBackgroundImage(String condition) {
    condition = condition.toLowerCase();
    if (condition.contains('sunny') || condition.contains('clear')) {
      return 'images/sunny.png';
    } else if (condition.contains('cloud') || condition.contains('overcast')) {
      return 'images/cloudy.png';
    } else if (condition.contains('rain')) {
      return 'images/rains.png';
    }
    //  else if (condition.contains('snow')) {
    //   return 'images/snow.jpg';
    //  } else if (condition.contains('thunder')) {
    //   return 'images/thunder.jpg';
    //  } else if (condition.contains('fog') || condition.contains('mist') || condition.contains('haze')) {
    //   return 'images/fog.jpg';
    // }
    //  else if (condition.contains('wind')) {
    //    return 'images/winds.jpg';
    //  }
    else {
      return 'images/wallpaper.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 225, 167, 30),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/wallpaper.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 50,
                      color: Color.fromARGB(255, 225, 167, 30),
                    ),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SearchPage()),
                      );
                      if (result != null && result.isNotEmpty) {
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(cityName: result);
                      }
                    },
                  ),
                ],
              ),
            );
          } // end of initial state
          else if (state is WeatherLoading) {
            // return the UI
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          } // end of loading state
          else if (state is WeatherSuccess) {
            //store weathermodel (object from weathermodel in the cubit that has the actual weather data) in weatherdata
            weatherData = BlocProvider.of<WeatherCubit>(context).weathermodel;
            //return another UI in case of success //////////////
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(getBackgroundImage(weatherData!.condition)),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      size: 50,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SearchPage()),
                      );
                      if (result != null && result.isNotEmpty) {
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(cityName: result);
                      }
                    },
                  ),
                  Text(
                    weatherData != null
                        ? weatherData!.city
                        : 'No city selected',
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Text(
                    weatherData != null ? '${weatherData!.temp}°C' : '--°C',
                    style: const TextStyle(color: Colors.white, fontSize: 70),
                  ),
                  Text(
                    weatherData != null ? weatherData!.condition : 'Condition',
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            );
          } // end of success state
          else if (state is WeatherFailure) {
            return const Center(
              child: Text('fail to fich'),
            );
          } // end of fail state
          return const SizedBox(); // fallback عشان كل الحالات مغطاه
        },
      ),
    );
  }
}
