// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nastea_billing/features/items/domain/entities/item_entity.dart';

// part 'items_state.freezed.dart';

class ItemsState {
  final List<ItemEntity> items;
  final bool isLoading;
  final String? error;

  const ItemsState({
    required this.items,
    required this.isLoading,
    this.error,
  });

  factory ItemsState.initial() => const ItemsState(
        items: [],
        isLoading: false,
      );

  ItemsState copyWith({
    List<ItemEntity>? items,
    bool? isLoading,
    String? error,
  }) {
    return ItemsState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
// @freezed
// class ItemsState with _$ItemsState {
//   const factory ItemsState.initial() = _ItemsInitial;
//   const factory ItemsState.loading() = _ItemsLoading;

//   //READ
//   const factory ItemsState.success(List<ItemEntity> items) = _ItemsSuccess;

//   //CREATE
//   const factory ItemsState.creating() = _ItemCreating;
//   const factory ItemsState.created(ItemEntity item) = _ItemCreated;

//   // UPDATE
//   const factory ItemsState.updating() = _ItemUpdating;
//   const factory ItemsState.updated(ItemEntity item) = _ItemUpdated;

//   // DELETE
//   const factory ItemsState.deleting() = _ItemDeleting;
//   const factory ItemsState.deleted(String itemId) = _ItemDeleted;

//   // ERROR
//   const factory ItemsState.error(String message) = _ItemsError;
// }
