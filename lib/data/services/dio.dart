import 'package:dio/dio.dart';
import 'package:news/constants/strings.dart';

class DioHelper{

  static late  Dio  dio;
  DioHelper(){
    BaseOptions baseOptions=BaseOptions(
      baseUrl: baseurl,
    receiveTimeout: 15*1000,
    sendTimeout: 15*1000,
    receiveDataWhenStatusError: true,
    );
    dio=Dio(baseOptions);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String ?token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

}
