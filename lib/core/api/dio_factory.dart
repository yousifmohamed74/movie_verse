import 'package:dio/dio.dart';
import 'package:movie_verse/core/Api/api_constants.dart';

class DioFactory {  

   static Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,        
      ),
    );

  static Future<Response> getData({    
    required String path,    
  }) async {
    final response = await dio.get(
      path,
      options: Options(headers: {
        'Authorization': 'Bearer ${ApiConstants.apikey}',
      }),
    );
    return response;
  }

  static Future<Response> getMoviesBySearch({
    required String  title,
    required String path,
    String? token,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: {"query":title},            
      options: Options(headers: {
        'Authorization': 'Bearer ${ApiConstants.apikey}',
      }),
    );
    return response;
  }
  
}