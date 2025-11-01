import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';

import '../../../items/domain/entities/item_entity.dart';
import '../../../items/presentation/controller/items_provider.dart';

class DashboardItems extends HookConsumerWidget {
  const DashboardItems({super.key});

  int _getItemsCount(List<ItemEntity> items) {
    return items.length < 2 ? items.length : 2;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsState = ref.watch(itemsProvider);

    int itemCount = _getItemsCount(itemsState.items);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final item = itemsState.items[index];
          return ItemTile(
            name: item.name,
            price:
                '${item.variants.first.label} • ₹${item.variants.first.price}',
            status: 'In Stock',
          );
        },
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String name;
  final String price;
  final String status;

  const ItemTile({
    super.key,
    required this.name,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool inStock = status.toLowerCase().contains('in');

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFFE1F0E8),
        child: Icon(
          Icons.local_cafe_rounded,
          color: inStock ? const Color(0xFF146356) : Colors.grey,
        ),
      ),
      title: NasteaText.body(name, fontWeight: FontWeight.w500),
      subtitle: NasteaText.body(price, color: Colors.black87),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: inStock ? Colors.green.shade100 : Colors.red.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: NasteaText.body(
          status,
          color: inStock ? Colors.green.shade800 : Colors.red.shade800,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
