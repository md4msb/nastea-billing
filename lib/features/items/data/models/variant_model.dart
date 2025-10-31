part of 'item_model.dart';

class VariantModel extends VariantEntity {
  const VariantModel({
    required super.label,
    required super.price,
    required super.weight,
  });

  factory VariantModel.fromJson(Map<String, dynamic> data) {
    return VariantModel(
      label: data['label'] ?? '',
      price: (data['price'] as num).toDouble(),
      weight: (data['weight'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'label': label,
    'price': price,
    'weight': weight,
  };

  factory VariantModel.fromEntity(VariantEntity data) =>
      VariantModel(label: data.label, price: data.price, weight: data.weight);
}
