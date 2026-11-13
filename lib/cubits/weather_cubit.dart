import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_state.dart';
import 'package:weather_app/pages/model.dart';
import 'package:weather_app/pages/service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherservice) : super(WeatherInitial());
  WeatherService weatherservice;
  WeatherModel? weathermodel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weathermodel = await weatherservice.getWeather(cityName);
      emit(WeatherSuccess());
    } on Exception {
      emit(WeatherFailure());
    }
  }
}
