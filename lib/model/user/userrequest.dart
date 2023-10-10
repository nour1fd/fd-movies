import 'package:dio/dio.dart';
import 'package:movies/const.dart';

class LoginWeb {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
  }


  static Future<Response<dynamic>> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return dio.post(url, data: data,
        queryParameters: query
    );
  }

}
