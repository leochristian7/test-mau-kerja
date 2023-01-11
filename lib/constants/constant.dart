// ignore_for_file: constant_identifier_names

class Constants {
  Constants._();

  static const int HttpSuccessStart = 200;
  static const int HttpSuccessEnd = 300;
  static bool httpSuccessRange(int code) =>
      code >= HttpSuccessStart && code <= HttpSuccessEnd;
  static const int HttpSuccessGetCode = 200;
  static const int HttpSuccessPostCode = 201;
  static const int HttpSuccessPutCode = 202;
  static const int HttpUnauthorized = 401;
  static const int HttpAuthorizationRevoked = 402;
  static const int HttpForbidden = 403;
  static const int HttpNotFound = 404;
  static const int HttpInvalidCredentials = 400;
  static const String baseUrl =
      'https://private-b9a758-candidattest.apiary-mock.com/';
  static const String candidates = 'candidates';
  static const String blogs = 'blogs';
  static const String email = 'emails';
  static const String address = 'address';
  static const String experiences = 'experiences';
}
