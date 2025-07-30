import 'package:dio/dio.dart';
import 'package:movie_verse/core/Api/api_constants.dart';

class DioFactory {
  static late Dio dio;
  static void init() async {   
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,        
      ),
    );
  }


  static Future<Response> getData({    
    required String path,
    String? token,
  }) async {
    final response = await dio.get(
      path,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    return response;
  }

  static Future<Response> getMovieDetailsWithId({
    int ? id,
    required String path,
    String? token,
  }) async {
    final response = await dio.get(
      "${path}movie_id$id",      
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    return response;
  }

  static Future<Response> getMovieWithTitle({
    String ? title,
    required String path,
    String? token,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: {"query":title},      
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );
    return response;
  }
  
}