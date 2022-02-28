import 'package:weather_home_work/models/weather_model.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather({required String city});
}
