import 'package:nastea_billing/features/items/domain/entities/item_entity.dart';

abstract class ItemsDataSource {
  Future<List<ItemEntity>> getItemsList();
  Future<void> createItem(ItemEntity item);
  Future<void> updateItem(ItemEntity item);
  Future<void> deleteItem(String id);
}
