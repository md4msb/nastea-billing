import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/extensions/nastea_text_styles.dart';
import 'package:nastea_billing/features/bills/data/items.dart';

import '../../../items/data/models/item/item_model.dart';

class ItemSelector extends StatefulWidget {
  const ItemSelector({super.key});

  @override
  State<ItemSelector> createState() => _ItemSelectorState();
}

class _ItemSelectorState extends State<ItemSelector> {
  Item itemTab = items[0];

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Items",
          style: NasteaTextStyles.body(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),

        Gap(5),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.map((item) {
            return ChoiceChip(
              label: Text(item.name),
              selected: (item == itemTab) ? true : false,
              onSelected: (bool selected) {
                setState(() {
                  itemTab = item;
                });
              },
              backgroundColor: Color.fromARGB(255, 247, 255, 250),
              selectedColor: Color(0xFFFFF8E1),
            );
          }).toList(),
        ),

        Column(
          children: itemTab.variants.map((variant) {
            return Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xFFD8DADC), width: 1),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          variant.label,
                          style: NasteaTextStyles.body(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Gap(4),
                        Text(
                          'Price: ${variant.price.toInt()}',
                          style: NasteaTextStyles.body(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: 90,
                      height: 32,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFFD8DADC), width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(31, 43, 43, 43),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: (variant.selectedQuantity > 0)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => _decrementQuantity(variant),
                                  onLongPress: () =>
                                      _decrementQuantity(variant, 10),
                                  child: Icon(
                                    Icons.remove,
                                    size: 22,
                                    color: Color(0xFF46A56C),
                                  ),
                                ),

                                Text(
                                  '${variant.selectedQuantity}',
                                  style: NasteaTextStyles.body(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF46A56C),
                                  ),
                                ),

                                InkWell(
                                  onTap: () => _incrementQuantity(variant),
                                  onLongPress: () =>
                                      _incrementQuantity(variant, 10),
                                  child: Icon(
                                    Icons.add,
                                    size: 22,
                                    color: Color(0xFF46A56C),
                                  ),
                                ),
                              ],
                            )
                          : InkWell(
                              onTap: () => _incrementQuantity(variant),
                              child: Center(
                                child: Text(
                                  'ADD',
                                  style: NasteaTextStyles.body(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF46A56C),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _incrementQuantity(Variant variant, [int incrementBy = 1]) {
    final updatedVariant = variant.copyWith(
      selectedQuantity: variant.selectedQuantity + incrementBy,
    );
    _updateItem(variant, updatedVariant);
  }

  void _decrementQuantity(Variant variant, [int decrementBy = 1]) {
    final updatedVariant = variant.copyWith(
      selectedQuantity: ((variant.selectedQuantity - decrementBy).isNegative)
          ? 0
          : variant.selectedQuantity - decrementBy,
    );
    _updateItem(variant, updatedVariant);
  }

  void _updateItem(Variant variant, Variant updatedVariant) {
    final updatedVariants = itemTab.variants
        .map((v) => v == variant ? updatedVariant : v)
        .toList();
    final updatedItem = itemTab.copyWith(variants: updatedVariants);

    setState(() {
      // Update the items list as well
      final itemIndex = items.indexWhere((item) => item.name == itemTab.name);
      if (itemIndex != -1) {
        items[itemIndex] = updatedItem;
      }
      itemTab = updatedItem;
    });
  }
}
