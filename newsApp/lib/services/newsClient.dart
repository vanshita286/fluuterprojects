import 'package:dio/dio.dart';

class NewsClient {
  Dio _dio = Dio();

  getNews() async {
    String URL =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=79ebfe85f9174f13889847dbf27ebfc6";

    try {
      Response resp = await _dio.get(URL);
      print("The response from server is: $resp");
      return resp.data;
    } catch (error) {
      print("ERROR $error");
    }
  }
}
