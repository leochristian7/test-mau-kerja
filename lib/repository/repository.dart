import 'package:dio/dio.dart';
import 'package:mau_kerja/data/response.dart';
import 'package:mau_kerja/model/model_address.dart';
import 'package:mau_kerja/model/model_blog.dart';
import 'package:mau_kerja/model/model_candidate.dart';
import 'package:mau_kerja/model/model_email.dart';
import 'package:mau_kerja/model/model_experience.dart';
import 'package:mau_kerja/rest/rest.dart';

class Repository {
  Rest rest = Rest.instance;

  Repository._();

  static final instance = Repository._();

  Future<WorkResponse<CandidateResponse>> getCandidates() async {
    final response = await rest.getCandidates();

    if (response.isSuccess()) {
      print(response.data);
      return WorkResponse.success(CandidateResponse.fromJson(response.data));
    } else {
      return WorkResponse.error(response.data, errorCode: response.successCode);
    }
  }

  Future<WorkResponse<EmailResponse>> getEmails() async {
    final response = await rest.getEmails();

    if (response.isSuccess()) {
      return WorkResponse.success(EmailResponse.fromJson(response.data));
    } else {
      return WorkResponse.error(response.data, errorCode: response.successCode);
    }
  }

  Future<WorkResponse<BlogResponse>> getBlogs() async {
    final response = await rest.getBlogs();

    if (response.isSuccess()) {
      print(response.data);
      return WorkResponse.success(BlogResponse.fromJson(response.data));
    } else {
      return WorkResponse.error(response.data, errorCode: response.successCode);
    }
  }

  Future<WorkResponse<ExperienceResponse>> getExperience() async {
    final response = await rest.getExperience();

    if (response.isSuccess()) {
      return WorkResponse.success(ExperienceResponse.fromJson(response.data));
    } else {
      return WorkResponse.error(response.data, errorCode: response.successCode);
    }
  }

  Future<WorkResponse<AddressResponse>> getAddress() async {
    final response = await rest.getAddress();

    if (response.isSuccess()) {
      return WorkResponse.success(AddressResponse.fromJson(response.data));
    } else {
      return WorkResponse.error(response.data, errorCode: response.successCode);
    }
  }
}
