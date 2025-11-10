// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsersNotifier)
const usersProvider = UsersNotifierProvider._();

final class UsersNotifierProvider
    extends $NotifierProvider<UsersNotifier, UsersState> {
  const UsersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersNotifierHash();

  @$internal
  @override
  UsersNotifier create() => UsersNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersState>(value),
    );
  }
}

String _$usersNotifierHash() => r'8c5c110e80e57245923a9523dc92af2fa1246e39';

abstract class _$UsersNotifier extends $Notifier<UsersState> {
  UsersState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UsersState, UsersState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UsersState, UsersState>,
              UsersState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
