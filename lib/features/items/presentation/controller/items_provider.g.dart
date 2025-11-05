// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ItemsNotifier)
const itemsProvider = ItemsNotifierProvider._();

final class ItemsNotifierProvider
    extends $NotifierProvider<ItemsNotifier, ItemsState> {
  const ItemsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemsNotifierHash();

  @$internal
  @override
  ItemsNotifier create() => ItemsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemsState>(value),
    );
  }
}

String _$itemsNotifierHash() => r'798d68c9980cbd598c09b8426d6609f4ac2b25ed';

abstract class _$ItemsNotifier extends $Notifier<ItemsState> {
  ItemsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ItemsState, ItemsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ItemsState, ItemsState>,
              ItemsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
