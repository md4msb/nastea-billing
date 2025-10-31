import 'package:dartz/dartz.dart';
import '../entities/item_entity.dart';

abstract class ItemsRepo {
  Future<Either<String, List<ItemEntity>>> getItemsList();
  Future<Either<String, Unit>> createItem(ItemEntity item);
  Future<Either<String, Unit>> updateItem(ItemEntity item);
  Future<Either<String, Unit>> deleteItem(String id);
}
