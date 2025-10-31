import 'package:dartz/dartz.dart';
import 'package:nastea_billing/core/handlers/error-handler/error_handler.dart';
import '../datasources/items_data_source.dart';
import 'package:nastea_billing/features/items/domain/entities/item_entity.dart';
import 'package:nastea_billing/features/items/domain/repositories/items_repo.dart';

class ItemsRepoImpl implements ItemsRepo {
  final ItemsDataSource itemsDataSource;

  const ItemsRepoImpl({required this.itemsDataSource});

  @override
  Future<Either<String, List<ItemEntity>>> getItemsList() async {
    try {
      final items = await itemsDataSource.getItemsList();
      return Right(items);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> createItem(ItemEntity item) async {
    try {
      await itemsDataSource.createItem(item);
      return Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> updateItem(ItemEntity item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Unit>> deleteItem(String id) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }
}
