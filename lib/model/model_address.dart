import 'package:json_annotation/json_annotation.dart';

part 'model_address.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressResponse {
  final List<ModelAddress>? results;

  AddressResponse(this.results);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ModelAddress {
  final int id;
  final String address;
  final String city;
  final String state;
  @JsonKey(name: 'zip_code')
  final int zipCode;

  ModelAddress({
    required this.id,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  Map<String, dynamic> toJson() => _$ModelAddressToJson(this);

  factory ModelAddress.fromJson(Map<String, dynamic> json) =>
      _$ModelAddressFromJson(json);
}
