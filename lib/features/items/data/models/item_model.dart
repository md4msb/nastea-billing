import 'package:nastea_billing/features/items/domain/entities/item_entity.dart';

part 'variant_model.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required super.id,
    required super.name,
    required super.variants,
  });

  factory ItemModel.fromJson(Map<String, dynamic> data) {
    return ItemModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      variants: (data['variants'] as List)
          .map((v) => VariantModel.fromJson(v))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    "name": name,
    'variants': variants.map((v) => (v as VariantModel).toJson()).toList(),
  };

  factory ItemModel.fromEntity(ItemEntity data) => ItemModel(
    id: data.id,
    name: data.name,
    variants: data.variants.map(VariantModel.fromEntity).toList(),
  );
}
