// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bills_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BillNotifier)
const billProvider = BillNotifierProvider._();

final class BillNotifierProvider
    extends $NotifierProvider<BillNotifier, List<BillModel>> {
  const BillNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'billProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$billNotifierHash();

  @$internal
  @override
  BillNotifier create() => BillNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BillModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BillModel>>(value),
    );
  }
}

String _$billNotifierHash() => r'13bc23b46955fd5f9b7d062ca6fb5fea2931ab46';

abstract class _$BillNotifier extends $Notifier<List<BillModel>> {
  List<BillModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<BillModel>, List<BillModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<BillModel>, List<BillModel>>,
              List<BillModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
