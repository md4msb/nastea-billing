import 'package:equatable/equatable.dart';

part 'variant_entity.dart';

class ItemEntity extends Equatable {
  final String id;
  final String name;
  final List<VariantEntity> variants;

  const ItemEntity({
    required this.id,
    required this.name,
    required this.variants,
  });

  @override
  List<Object?> get props => [id, name, variants];
}
