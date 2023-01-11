// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceResponse _$ExperienceResponseFromJson(Map<String, dynamic> json) =>
    ExperienceResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ModelExperience.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExperienceResponseToJson(ExperienceResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

ModelExperience _$ModelExperienceFromJson(Map<String, dynamic> json) =>
    ModelExperience(
      id: json['id'] as int,
      status: json['status'] as String,
      jobTitle: json['job_title'] as String,
      companyName: json['company_name'] as String,
      industry: json['industry'] as String,
    );

Map<String, dynamic> _$ModelExperienceToJson(ModelExperience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'job_title': instance.jobTitle,
      'company_name': instance.companyName,
      'industry': instance.industry,
    };
