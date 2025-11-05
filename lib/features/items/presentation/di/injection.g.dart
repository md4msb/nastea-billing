// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemsRepo)
const itemsRepoProvider = ItemsRepoProvider._();

final class ItemsRepoProvider
    extends $FunctionalProvider<ItemsRepo, ItemsRepo, ItemsRepo>
    with $Provider<ItemsRepo> {
  const ItemsRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemsRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemsRepoHash();

  @$internal
  @override
  $ProviderElement<ItemsRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItemsRepo create(Ref ref) {
    return itemsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemsRepo>(value),
    );
  }
}

String _$itemsRepoHash() => r'2218caf508874042ee4a7292b51da723928ff493';

@ProviderFor(itemsDataSource)
const itemsDataSourceProvider = ItemsDataSourceProvider._();

final class ItemsDataSourceProvider
    extends
        $FunctionalProvider<ItemsDataSource, ItemsDataSource, ItemsDataSource>
    with $Provider<ItemsDataSource> {
  const ItemsDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemsDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemsDataSourceHash();

  @$internal
  @override
  $ProviderElement<ItemsDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ItemsDataSource create(Ref ref) {
    return itemsDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemsDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemsDataSource>(value),
    );
  }
}

String _$itemsDataSourceHash() => r'718fd218cc4380964c7b3eeae08bf376a6e1fc52';
