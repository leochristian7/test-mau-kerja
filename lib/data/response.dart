import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mau_kerja/constants/constant.dart';
import 'package:mau_kerja/model/error_response.dart';

abstract class _Response {
  _Response(this._response);

  final Response? _response;

  bool isSuccess() =>
      _response != null && Constants.httpSuccessRange(_response!.statusCode!);

  bool isNotFound() => _response?.statusCode == Constants.HttpNotFound;

  int get statusCode => _response?.statusCode ?? -1;

  dynamic get data => _response?.data;

  int get successCode;
}

class ResponseGet extends _Response {
  ResponseGet(Response? response) : super(response);

  factory ResponseGet.fromResponse(Response response) {
    return ResponseGet(response);
  }

  static Future<ResponseGet> fromRequest(Dio dio, String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return ResponseGet.fromResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return ResponseGet(null);
    }
  }

  @override
  int get successCode => Constants.HttpSuccessGetCode;
}

class ResponseDelete extends _Response {
  ResponseDelete(Response? response) : super(response);

  factory ResponseDelete.fromResponse(Response response) {
    return ResponseDelete(response);
  }

  static Future<ResponseDelete> fromRequest(Dio dio, String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.delete(path, queryParameters: queryParameters);
      return ResponseDelete.fromResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return ResponseDelete(null);
    }
  }

  @override
  int get successCode => Constants.HttpSuccessGetCode;
}

class ResponsePost extends _Response {
  ResponsePost(Response? response) : super(response);

  factory ResponsePost.fromResponse(Response response) {
    return ResponsePost(response);
  }

  static Future<ResponsePost> fromRequest(Dio dio, String path,
      {Map<String, dynamic>? queryParameters, bool isFormData = false}) async {
    try {
      final response = await dio.post(path,
          queryParameters: !isFormData ? queryParameters : null,
          data: isFormData && queryParameters != null
              ? FormData.fromMap(queryParameters)
              : null);
      ;

      return ResponsePost.fromResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return ResponsePost(null);
    }
  }

  @override
  int get successCode => Constants.HttpSuccessPostCode;
}

class ResponsePut extends _Response {
  ResponsePut(Response? response, {this.overrideSuccessCode}) : super(response);

  factory ResponsePut.fromResponse(Response response,
      {int? overrideSuccessCode}) {
    return ResponsePut(response, overrideSuccessCode: overrideSuccessCode);
  }

  static Future<ResponsePut> fromRequest(Dio dio, String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final startTime = DateTime.now().millisecondsSinceEpoch;
      final response = await dio.put(path,
          data: queryParameters != null
              ? FormData.fromMap(queryParameters)
              : null)
        ..headers.removeAll('Content-Type')
        ..headers.add('Content-Type', 'application/x-www-form-urlencoded');
      final endTime = DateTime.now().millisecondsSinceEpoch;
      return ResponsePut.fromResponse(response,
          overrideSuccessCode: Constants.HttpSuccessGetCode);
    } catch (e) {
      debugPrint(e.toString());
      return ResponsePut(null);
    }
  }

  final int? overrideSuccessCode;

  @override
  int get successCode => overrideSuccessCode ?? Constants.HttpSuccessPutCode;
}

class WorkResponse<T> {
  WorkResponse._();
  bool isSuccess() => this is _ResponseSuccess;

  bool isError() => this is _ResponseError;

  static WorkResponse<T> success<T>(T data) {
    return _ResponseSuccess(data);
  }

  static WorkResponse<T> error<T>(dynamic responseData,
      {int errorCode = _ResponseError.UNKNOWN_ERROR_CODE}) {
    return _ResponseError(responseData, errorCode: errorCode);
  }

  T getData() {
    assert(this is _ResponseSuccess);
    return (this as _ResponseSuccess).data;
  }

  String getErrorMessage() {
    if (isError()) {
      return (this as _ResponseError).errorMessage;
    } else {
      return '';
    }
  }

  int getErrorCode() {
    if (isError()) {
      return (this as _ResponseError).errorCode;
    } else
      return -1;
  }
}

class _ResponseSuccess<T> extends WorkResponse<T> {
  _ResponseSuccess(this.data) : super._();

  final T data;
}

class _ResponseError<T> extends WorkResponse<T> {
  _ResponseError(this.responseData, {this.errorCode = UNKNOWN_ERROR_CODE})
      : super._();

  int errorCode;
  dynamic responseData;

  String get errorMessage {
    if (responseData is String) {
      return responseData;
    }
    try {
      final error = ErrorResponse.fromJson(responseData);
      return error.error?.errors?.join(', ') ?? _unknownErrorMessage;
    } catch (e) {
      return _unknownErrorMessage;
    }
  }

  static const UNKNOWN_ERROR_CODE = -1;
}

const _unknownErrorMessage = 'Unknown Error';
