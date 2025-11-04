import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
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
        title: NasteaText.heading("Products ", fontWeight: FontWeight.w600),
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
                    title: NasteaText.body(
                      item.name,
                      fontWeight: FontWeight.w500,
                    ),

                    subtitle: NasteaText.body(
                      "${item.variants.length} variants",
                    ),
                    trailing: PopupMenuButton(
                      padding: EdgeInsetsGeometry.all(0),
                      menuPadding: EdgeInsets.all(0),
                      // color: Color(0xFFFBFDFB),
                      child: Icon(Icons.more_vert_rounded),

                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            onTap: () {
                              context.pushNamed(
                                RouteNames.itemUpdate,
                                pathParameters: {'id': item.id},
                              );
                            },
                            child: Center(
                              child: NasteaText.body(
                                'Update',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              ref.watch(itemsProvider.notifier).deleteItem(item.id);
                            },
                            child: Center(
                              child: NasteaText.body(
                                'Delete',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ];
                      },
                    ),
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

                        title: NasteaText.body(
                          "${variant.label} • ₹${variant.price}",
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
          context.pushNamed(RouteNames.itemCreate);
        },
      ),
    );
  }
}
