import 'package:dio/dio.dart';
import 'package:egymation/core/utils/constants.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseURL,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type' :'application/json',
        }
      ),

    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query}) async
  {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> getResponse({
    required String url,
    Map<String, dynamic>? query})
  {
    return dio.get(url, queryParameters: query);
  }


  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    return await dio.post(
        path,
        data: data,
        queryParameters: query);
  }
}