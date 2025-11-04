import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/helpers/helpers.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../../domain/entities/item_entity.dart';
import '../controller/items_provider.dart';

class ItemFormScreen extends HookConsumerWidget {
  final String? itemId; // null = create, not null = update

  const ItemFormScreen({super.key, this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = itemId != null;
    final notifier = ref.read(itemsProvider.notifier);

    // Controllers
    final nameController = useTextEditingController();
    final weightController = useTextEditingController();
    final priceController = useTextEditingController();

    // Local variant list
    final variants = useState<List<VariantEntity>>([]);

    // Load existing data when editing
    useEffect(() {
      if (isEditing) {
        final item = notifier.findItemById(itemId!);
        if (item != null) {
          nameController.text = item.name;
          variants.value = List.of(item.variants);
        }
      }
      return null;
    }, []);

    bool validate() {
      if (nameController.text.trim().isEmpty) {
        ErrorToaster.showError(context, message: 'Item name is required');
        return false;
      }
      if (variants.value.isEmpty) {
        ErrorToaster.showError(
          context,
          message: 'At least one variant is required',
        );
        return false;
      }
      return true;
    }

    void onSave() async {
      final name = nameController.text.trim();
      if (!validate()) return;

      if (isEditing) {
        final item = ItemEntity(
          id: itemId!,
          name: name,
          variants: variants.value,
        );
        await notifier.updateItem(item);
      } else {
        await notifier.createItem(name, variants.value);
      }

      if (context.mounted) {
        context.pop();
      }
    }

    void addVariant() {
      final weight = double.tryParse(weightController.text.trim());
      final price = double.tryParse(priceController.text.trim());
      if (weight == null || price == null) {
        ErrorToaster.showError(context, message: 'Enter valid numbers');
        return;
      }
      variants.value = [
        ...variants.value,
        VariantEntity(
          label: notifier.getVariantLabel(weight),
          weight: weight,
          price: price,
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
          isEditing ? "Update Product" : "Create Product",
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

          NasteaText.body("Add Variants", fontWeight: FontWeight.w500),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: weightController,
                  hintText: 'Weight (gm)',
                  maxLines: 1,
                  fillColor: Colors.white,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Gap(12),
              Expanded(
                child: CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                  maxLines: 1,
                  fillColor: Colors.white,
                  keyboardType: TextInputType.number,
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
