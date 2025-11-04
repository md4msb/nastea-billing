import 'package:nastea_billing/features/items/domain/entities/item_entity.dart';
part 'variant_model.dart';

class ItemModel {
  final String id;
  final String name;
  final List<VariantModel> variants;

  const ItemModel({
    required this.id,
    required this.name,
    required this.variants,
  });

  /// From Firebase / JSON
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      variants: (json['variants'] as List<dynamic>)
          .map((v) => VariantModel.fromJson(v))
          .toList(),
    );
  }

  /// Convert to Firebase / JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'variants': variants.map((v) => v.toJson()).toList(),
    };
  }

  /// Create model from Entity (for writing to Firestore)
  factory ItemModel.fromEntity(ItemEntity entity) {
    return ItemModel(
      id: entity.id,
      name: entity.name,
      variants: entity.variants.map((v) => VariantModel.fromEntity(v)).toList(),
    );
  }

  /// Convert Model > Entity
  ItemEntity toEntity() {
    return ItemEntity(
      id: id,
      name: name,
      variants: variants.map((v) => v.toEntity()).toList(),
    );
  }
}
