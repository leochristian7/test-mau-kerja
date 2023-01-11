import 'package:dio/dio.dart';
import 'package:mau_kerja/constants/constant.dart';

class RestApi {
  static BaseOptions options() => BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        followRedirects: false,
        validateStatus: (status) => true,
      );
  final Dio _dio;

  RestApi(
    this._dio,
  );

  Dio dio() {
    return _dio;
  }
}
