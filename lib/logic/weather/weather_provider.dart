import 'package:dio/dio.dart';
import 'package:weather_home_work/helpers/app_error.dart';
import 'package:weather_home_work/helpers/dio_settings.dart';
import 'package:weather_home_work/logic/weather/weather_repository.dart';
import 'package:weather_home_work/models/weather_model.dart';

class WeatherProvider implements WeatherRepository {
  WeatherProvider();

  final Dio dio = DioSettings().dio;

  @override
  Future<Weather> getWeather({required String city}) async {
    try {
      final response = await dio
          .get("http://api.weatherapi.com/v1/current.json", queryParameters: {
        'key': "19d37dd259154b038f592235221802",
        'q': city,
      });

      return Weather.fromJson(response.data);
    } catch (error) {
      throw CatchException.convertException(error);
    }
  }
}
