import 'package:nastea_billing/features/items/domain/entities/item_entity.dart';
import 'package:nastea_billing/features/items/domain/repositories/items_repo.dart';
import 'package:nastea_billing/features/items/presentation/controller/state/items_state.dart';
import 'package:nastea_billing/features/items/presentation/di/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'items_provider.g.dart';

@Riverpod(keepAlive: true)
class ItemsNotifier extends _$ItemsNotifier {
  late final ItemsRepo _itemsRepo;
  List<ItemEntity> _cachedItems = [];
  final _uuid = const Uuid();

  @override
  ItemsState build() {
    _itemsRepo = ref.read(itemsRepoProvider);
    Future.microtask(() => loadItems(useLoading: true));
    return ItemsState.initial();
  }

  Future<void> loadItems({bool useLoading = false}) async {
    if (useLoading) state = state.copyWith(isLoading: true, error: null);

    final result = await _itemsRepo.getItemsList();

    state = result.fold(
      (error) => state.copyWith(isLoading: false, error: error),
      (items) {
        _cachedItems = items;
        return ItemsState(items: _cachedItems, isLoading: false);
      },
    );
  }

  Future<void> createItem(String name, List<VariantEntity> variants) async {
    state = state.copyWith(isLoading: true, error: null);

    final id = _uuid.v4();
    final item = ItemEntity(id: id, name: name, variants: variants);

    final result = await _itemsRepo.createItem(item);
    state = result.fold(
      (error) => state.copyWith(isLoading: false, error: error),
      (_) {
        _cachedItems.add(item);
        return state.copyWith(items: _cachedItems, isLoading: false);
      },
    );
  }

  Future<void> updateItem(ItemEntity updatedItem) async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _itemsRepo.updateItem(updatedItem);
    state = result.fold(
      (error) => state.copyWith(isLoading: false, error: error),
      (_) {
        int index = _cachedItems.indexWhere(
          (item) => item.id == updatedItem.id,
        );
        if (index < 0) return state.copyWith(isLoading: false);

        _cachedItems[index] = updatedItem;

        return state.copyWith(items: _cachedItems, isLoading: false);
      },
    );
  }

  Future<void> deleteItem(String id) async {
    state = state.copyWith(isLoading: true, error: null);
    final result = await _itemsRepo.deleteItem(id);
    state = result.fold(
      (error) => state.copyWith(isLoading: false, error: error),
      (_) {
        _cachedItems.removeWhere((item) => item.id == id);
        return state.copyWith(items: _cachedItems, isLoading: false);
      },
    );
  }

  ItemEntity? findItemById(String id) {
    try {
      return _cachedItems.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }

  String getVariantLabel(double weight) {
    if ((weight % 1000).abs() < 0.0001) {
      final kg = (weight / 1000).round();
      return '${kg}kg';
    } else {
      final gmStr = (weight % 1 == 0)
          ? weight.toInt().toString()
          : weight.toString();
      return '${gmStr}gm';
    }
  }
}
