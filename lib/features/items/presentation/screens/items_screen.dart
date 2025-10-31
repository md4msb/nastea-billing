import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/features/items/presentation/controller/items_provider.dart';

class ItemsScreen extends HookConsumerWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsState = ref.watch(itemsProvider);

    return Scaffold(
      backgroundColor: Color(0xFFFBFDFB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBFDFB),
        title: Text(
          "Products ",
          style: NasteaTextStyles.heading(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: itemsState.items.length,
          itemBuilder: (context, index) {
            final item = itemsState.items[index];
            return Card(
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.black12,
              margin: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Color(0xFFEEF7F1),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Icon(
                        Icons.coffee_rounded,
                        color: Color(0xFF36825F),
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: NasteaTextStyles.body(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "${item.variants.length} variants",
                      style: NasteaTextStyles.body(),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: item.variants.length,
                    itemBuilder: (context, index) {
                      final variant = item.variants[index];
                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),

                        title: Text(
                          "${variant.label} • ₹${variant.price}",
                          style: NasteaTextStyles.body(fontSize: 14),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: Color(0xFFC7F279).blendWith(Colors.white, 0.8),
        foregroundColor: Color(0xFF2A2924).blendWith(Color(0xFFC7F279), 0.85),
        child: Icon(Icons.add),
        onPressed: () {
          // context.pushNamed(RouteNames.itemCreateScreen);
          // showModalBottomSheet(
          //   context: context,
          //   backgroundColor: Color(0xFFFBFDFB),
          //   builder: (context) {
          //     return Container();
          //   },
          // );
        },
      ),
    );
  }
}
