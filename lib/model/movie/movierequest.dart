
import 'package:dio/dio.dart';
import 'package:movies/model/movie/moviemodel.dart';
class MovieRequest{
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://api.themoviedb.org/3/movie/popular",
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
  }


  static Future<List<Results>?>getData(
      )async{
    dio.options.headers={
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTBmMjI5NjQxYWU0ZmJhZTBkN2M0M2ViYmZjODE0ZiIsInN1YiI6IjYxYTlmYjBkZTI2N2RlMDA2NDI4OTdkMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OXLJZGOuiVAu_cJ7oi6fT3z0n57hELF3K1ZCupewUl0',
    };
    final response=
    await dio.get('https://api.themoviedb.org/3/movie/popular');
    print(response.data);
    return MovieModel.fromJson(response.data).results;

  }
}
