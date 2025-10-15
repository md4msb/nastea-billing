

import 'package:nastea_billing/features/items/data/models/item/item_model.dart';

List<Item> items = [
  Item(
    name: 'Premium',
    variants: [
      Variant(label: '1 kg', weight: 1000, price: 232),
      Variant(label: '250 gm', weight: 250, price: 63, selectedQuantity: 1),
      Variant(label: '100 gm', weight: 100, price: 32),
    ],
  ),
  Item(
    name: 'Hotel Blend',
    variants: [
      Variant(label: '1 kg', weight: 1000, price: 195),
      Variant(label: '5 kg', weight: 5000, price: 925),
    ],
  ),
  Item(
    name: 'Loose',
    variants: [
      Variant(label: '1 kg', weight: 1000, price: 150),
      Variant(label: '3 kg', weight: 3000, price: 450),
    ],
  ),
];
