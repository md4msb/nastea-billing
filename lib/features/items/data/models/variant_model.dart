part of 'item_model.dart';

class VariantModel {
  final String label;
  final double price;
  final double weight;

  const VariantModel({
    required this.label,
    required this.price,
    required this.weight,
  });

  // From Firebase / JSON
  factory VariantModel.fromJson(Map<String, dynamic> data) {
    return VariantModel(
      label: data['label'] ?? '',
      price: (data['price'] as num).toDouble(),
      weight: (data['weight'] as num).toDouble(),
    );
  }

  // Convert to Firebase / JSON
  Map<String, dynamic> toJson() {
    return {'label': label, 'price': price, 'weight': weight};
  }

  // Create model from Entity (for writing to Firestore)
  factory VariantModel.fromEntity(VariantEntity entity) {
    return VariantModel(
      label: entity.label,
      price: entity.price,
      weight: entity.weight,
    );
  }

  // Convert Model > Entity
  VariantEntity toEntity() {
    return VariantEntity(label: label, price: price, weight: weight);
  }
}
