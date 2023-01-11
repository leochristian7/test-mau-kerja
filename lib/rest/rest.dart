import 'package:dio/dio.dart';
import 'package:mau_kerja/constants/constant.dart';
import 'package:mau_kerja/data/response.dart';

class Rest {
  late Dio dio;
  Rest._() {
    dio = Dio();
  }

  static final instance = Rest._();

  Future<ResponseGet> getCandidates() async {
    return ResponseGet.fromRequest(
        dio, Constants.baseUrl + Constants.candidates);
  }

  Future<ResponseGet> getEmails() async {
    return ResponseGet.fromRequest(dio, Constants.baseUrl + Constants.email);
  }

  Future<ResponseGet> getExperience() async {
    return ResponseGet.fromRequest(
        dio, Constants.baseUrl + Constants.experiences);
  }

  Future<ResponseGet> getBlogs() async {
    return ResponseGet.fromRequest(dio, Constants.baseUrl + Constants.blogs);
  }

  Future<ResponseGet> getAddress() async {
    return ResponseGet.fromRequest(dio, Constants.baseUrl + Constants.address);
  }
}
