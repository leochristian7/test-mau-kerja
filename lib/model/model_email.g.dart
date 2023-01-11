// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailResponse _$EmailResponseFromJson(Map<String, dynamic> json) =>
    EmailResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ModelEmail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmailResponseToJson(EmailResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

ModelEmail _$ModelEmailFromJson(Map<String, dynamic> json) => ModelEmail(
      id: json['id'] as int,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ModelEmailToJson(ModelEmail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
    };
