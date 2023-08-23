import 'package:dio/dio.dart';

class YTClient {
  Dio _dio = Dio();

  getData() async {
    String url =
        "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=200&regionCode=IN&key=AIzaSyBSD8EfzTfzQvgFOo1dLob2enw-_rbS26E";

    try {
      Response resp = await _dio.get(url);
      return resp.data;
    } catch (err) {
      print("while fetching data\nfound: ${err}");
    }
  }
}
