import 'package:json_annotation/json_annotation.dart';

part 'model_email.g.dart';

@JsonSerializable(explicitToJson: true)
class EmailResponse {
  final List<ModelEmail>? results;

  EmailResponse(this.results);

  Map<String, dynamic> toJson() => _$EmailResponseToJson(this);

  factory EmailResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ModelEmail {
  final int id;
  final String email;
  final String phone;

  ModelEmail({
    required this.id,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$ModelEmailToJson(this);

  factory ModelEmail.fromJson(Map<String, dynamic> json) =>
      _$ModelEmailFromJson(json);
}
