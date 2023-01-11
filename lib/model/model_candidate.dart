import 'package:json_annotation/json_annotation.dart';

part 'model_candidate.g.dart';

@JsonSerializable(explicitToJson: true)
class CandidateResponse {
  final List<ModelCandidate>? results;

  CandidateResponse(this.results);

  Map<String, dynamic> toJson() => _$CandidateResponseToJson(this);

  factory CandidateResponse.fromJson(Map<String, dynamic> json) =>
      _$CandidateResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ModelCandidate {
  final int id;
  final String name;
  final String gender;
  final String photo;
  final int birthday;
  final int expired;

  ModelCandidate({
    required this.id,
    required this.name,
    required this.gender,
    required this.photo,
    required this.birthday,
    required this.expired,
  });

  Map<String, dynamic> toJson() => _$ModelCandidateToJson(this);

  factory ModelCandidate.fromJson(Map<String, dynamic> json) =>
      _$ModelCandidateFromJson(json);
}
