// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) =>
    AddressResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ModelAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

ModelAddress _$ModelAddressFromJson(Map<String, dynamic> json) => ModelAddress(
      id: json['id'] as int,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zip_code'] as int,
    );

Map<String, dynamic> _$ModelAddressToJson(ModelAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zip_code': instance.zipCode,
    };
