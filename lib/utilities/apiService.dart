import 'package:dio/dio.dart';

class Api {
//  ApiService._();
//
//  static final ApiService Api = ApiService._();

  Dio dio = new Dio();
  String baseUrl = 'http://192.168.43.12:8080/stream-it';

  Future<Map> postService(String url, Map data) async {
    try {
      Response res = await dio.post(baseUrl + url, data: data);
      return {'code': res.statusCode, 'data': res.data};
    } catch (e) {
      return {'code': '', 'data': e.response.data['message']};
    }
  }
}
