import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed 
abstract class Item with _$Item{
  const factory Item({
    required String name,
    required List<Variant> variants,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
abstract class Variant with _$Variant {
  const factory Variant({
    required String label,
    required double weight,
    required double price,
    @Default(0) int selectedQuantity,
  }) = _Variant;

  factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);
}