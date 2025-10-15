// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
  name: json['name'] as String,
  variants: (json['variants'] as List<dynamic>)
      .map((e) => Variant.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
  'name': instance.name,
  'variants': instance.variants,
};

_Variant _$VariantFromJson(Map<String, dynamic> json) => _Variant(
  label: json['label'] as String,
  weight: (json['weight'] as num).toDouble(),
  price: (json['price'] as num).toDouble(),
  selectedQuantity: (json['selectedQuantity'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VariantToJson(_Variant instance) => <String, dynamic>{
  'label': instance.label,
  'weight': instance.weight,
  'price': instance.price,
  'selectedQuantity': instance.selectedQuantity,
};
