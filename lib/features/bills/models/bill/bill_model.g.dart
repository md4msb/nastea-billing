// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillModel _$BillModelFromJson(Map<String, dynamic> json) => _BillModel(
  id: json['id'] as String,
  shopName: json['shopName'] as String,
  location: json['location'] as String,
  contact: json['contact'] as String,
  phone: json['phone'] as String,
  createdBy: json['createdBy'] as String,
  createdAt: json['createdAt'] as String,
  totalAmount: (json['totalAmount'] as num).toDouble(),
);

Map<String, dynamic> _$BillModelToJson(_BillModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopName': instance.shopName,
      'location': instance.location,
      'contact': instance.contact,
      'phone': instance.phone,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'totalAmount': instance.totalAmount,
    };
