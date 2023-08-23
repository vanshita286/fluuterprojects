import 'package:dio/dio.dart';

class WeatherClient {
  Dio _dio = Dio();
  Future<Map<String, dynamic>> getWeather(String cityname) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=${cityname}&appid=c44270f2e7d98708ecc3361b98d37e0d";

    try {
      Response resp = await _dio.get(url);
      // print("Response is: ${resp.data.runtimeType}");
      return resp.data;
    } catch (error) {
      print("found error: $error");
    }
    return {};
  }
}
