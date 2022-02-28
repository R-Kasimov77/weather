import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_home_work/logic/weather/weather_provider.dart';
import 'package:weather_home_work/models/weather_model.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherProvider weatherProvider = WeatherProvider();
  WeatherCubit() : super(WeatherState.initial());
  getWeatherInfo(String city) async {
    try {
      emit(WeatherState.loading());
      final response = await weatherProvider.getWeather(city: city);
      emit(WeatherState.loaded(response));
    } catch (e) {
      if (city.isEmpty) {
        emit(WeatherState.failed("pusto"));
      } else {
        emit(WeatherState.failed("такого города нет"));
      }
    }
  }
}

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.loaded(Weather weather) = _Loaded;
  const factory WeatherState.failed(String error) = _Failed;
}
