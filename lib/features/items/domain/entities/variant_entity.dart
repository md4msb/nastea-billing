part of 'item_entity.dart';

class VariantEntity extends Equatable {
  final String label;
  final double weight;
  final double price;

  const VariantEntity({
    required this.label,
    required this.price,
    required this.weight,
  });

  @override
  List<Object?> get props => [label, weight, price];
}
