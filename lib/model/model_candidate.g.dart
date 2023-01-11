// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateResponse _$CandidateResponseFromJson(Map<String, dynamic> json) =>
    CandidateResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ModelCandidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CandidateResponseToJson(CandidateResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

ModelCandidate _$ModelCandidateFromJson(Map<String, dynamic> json) =>
    ModelCandidate(
      id: json['id'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
      photo: json['photo'] as String,
      birthday: json['birthday'] as int,
      expired: json['expired'] as int,
    );

Map<String, dynamic> _$ModelCandidateToJson(ModelCandidate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'photo': instance.photo,
      'birthday': instance.birthday,
      'expired': instance.expired,
    };
