import 'package:json_annotation/json_annotation.dart';

part 'model_experience.g.dart';

@JsonSerializable(explicitToJson: true)
class ExperienceResponse {
  final List<ModelExperience>? results;

  ExperienceResponse(this.results);

  Map<String, dynamic> toJson() => _$ExperienceResponseToJson(this);

  factory ExperienceResponse.fromJson(Map<String, dynamic> json) =>
      _$ExperienceResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ModelExperience {
  final int id;
  final String status;
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @JsonKey(name: 'company_name')
  final String companyName;
  final String industry;

  ModelExperience({
    required this.id,
    required this.status,
    required this.jobTitle,
    required this.companyName,
    required this.industry,
  });

  Map<String, dynamic> toJson() => _$ModelExperienceToJson(this);

  factory ModelExperience.fromJson(Map<String, dynamic> json) =>
      _$ModelExperienceFromJson(json);
}
