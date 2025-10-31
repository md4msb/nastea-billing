import 'package:nastea_billing/features/items/domain/entities/item_entity.dart';
import 'package:nastea_billing/features/items/domain/repositories/items_repo.dart';
import 'package:nastea_billing/features/items/presentation/controller/state/items_state.dart';
import 'package:nastea_billing/features/items/presentation/di/injection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'items_provider.g.dart';

@Riverpod(keepAlive: true)
class ItemsNotifier extends _$ItemsNotifier {
  late final ItemsRepo _itemsRepo;
  List<ItemEntity> _cachedItems = [];

  @override
  ItemsState build() {
    _itemsRepo = ref.read(itemsRepoProvider);
    Future.microtask(() => loadItems(useLoading: true));
    return ItemsState.initial();
  }

  Future<void> loadItems({bool useLoading = false}) async {
    if (useLoading) state = state.copyWith(isLoading: true);

    final result = await _itemsRepo.getItemsList();

    state = result.fold(
      (error) => state.copyWith(isLoading: false, error: error),
      (items) {
        _cachedItems = items;
        return ItemsState(items: _cachedItems, isLoading: false);
      },
    );
  }

  Future<void> createItem() async {
    var item = ItemEntity(
      id: '00112233',
      name: 'Loose',
      variants: [
        VariantEntity(label: '1Kg', price: 132.0, weight: 1000),
        VariantEntity(label: '3Kg', price: 596.0, weight: 3000),
        VariantEntity(label: '10Kg', price: 1084.0, weight: 10000),
      ],
    );

    await _itemsRepo.createItem(item);
  }
}
