import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/widgets/src/app_button.dart';
import 'package:nastea_billing/core/widgets/src/custom_textfield.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../../domain/entities/item_entity.dart';
import '../controller/items_provider.dart';

class ItemFormScreen extends HookConsumerWidget {
  final String? itemId; // null = create, not null = update

  const ItemFormScreen({super.key, this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = itemId != null;
    final itemsState = ref.watch(itemsProvider);

    // Controllers
    final nameController = useTextEditingController();

    // Variant form temp state
    final weightController = useTextEditingController();
    final priceController = useTextEditingController();

    // Local variant list
    final variants = useState<List<VariantEntity>>([]);

    // Load existing data when editing
    useEffect(() {
      if (isEditing) {
        // final item = ref
        //     .read(itemsProvider.notifier)
        //     .findItemById(itemId!); // ← you should implement this

        // if (item != null) {
        //   nameController.text = item.name;
        //   descriptionController.text = item.description ?? "";
        //   variants.value = List.of(item.variants);
        // }
      }
      return null;
    }, []);

    void onSave() {
      // final name = nameController.text.trim();
      // if (name.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text("Item name is required")),
      //   );
      //   return;
      // }

      // final item = ItemEntity(
      //   id: itemId ?? "",
      //   name: name,
      //   description: descriptionController.text.trim(),
      //   variants: variants.value,
      // );

      // if (isEditing) {
      //   ref.read(itemsNotifierProvider.notifier).updateItem(item);
      // } else {
      //   ref.read(itemsNotifierProvider.notifier).createItem(item);
      // }

      // Navigator.pop(context);
    }

    void addVariant() {
      final weight = weightController.text.trim();
      final price = priceController.text.trim();

      if (weight.isEmpty || price.isEmpty) return;

      String label = double.parse(weight) >= 1000
          ? '${double.parse(weight) / 1000}kg'
          : '$Widget gm';

      variants.value = [
        ...variants.value,
        VariantEntity(
          label: label,
          weight: double.parse(weight),
          price: double.parse(price),
        ),
      ];

      weightController.clear();
      priceController.clear();
    }

    return Scaffold(
      backgroundColor: Color(0xFFFBFDFB),

      appBar: AppBar(
        backgroundColor: Color(0xFFFBFDFB),
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: NasteaText.heading(
          isEditing ? "Edit Product" : "Add Product",
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          NasteaText.body('Product Name', fontWeight: FontWeight.w500),

          Gap(8),
          CustomTextField(
            controller: nameController,
            hintText: 'Enter Product Name',
            maxLines: 1,
            fillColor: Colors.white,
          ),

          const Gap(26),

          NasteaText.body("Variants", fontWeight: FontWeight.w500),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: weightController,
                  hintText: 'Weight (gm)',
                  maxLines: 1,
                  fillColor: Colors.white,
                ),
              ),
              const Gap(12),
              Expanded(
                child: CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                  maxLines: 1,
                  fillColor: Colors.white,
                ),
              ),
              IconButton(
                onPressed: addVariant,
                icon: const Icon(Icons.add_circle),
              ),
            ],
          ),
          const Gap(12),

          if (variants.value.isNotEmpty)
            ...variants.value.map((v) {
              return ListTile(
                title: NasteaText.body(v.label),
                subtitle: NasteaText.body("₹ ${v.price}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    variants.value = List.of(variants.value)..remove(v);
                  },
                ),
              );
            }),

          const Gap(24),
          AppButton(
            text: isEditing ? "Update Product" : "Create Product",
            onPressed: onSave,
            backgroundColor: Color(0xFF46A56C),
          ),
        ],
      ),
    );
  }
}
