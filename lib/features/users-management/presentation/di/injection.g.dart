// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(usersRepo)
const usersRepoProvider = UsersRepoProvider._();

final class UsersRepoProvider
    extends $FunctionalProvider<UsersRepo, UsersRepo, UsersRepo>
    with $Provider<UsersRepo> {
  const UsersRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersRepoHash();

  @$internal
  @override
  $ProviderElement<UsersRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsersRepo create(Ref ref) {
    return usersRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersRepo>(value),
    );
  }
}

String _$usersRepoHash() => r'309c379c0230f5edd61467ae17949adacf10c7e6';

@ProviderFor(usersDataSource)
const usersDataSourceProvider = UsersDataSourceProvider._();

final class UsersDataSourceProvider
    extends
        $FunctionalProvider<UsersDataSource, UsersDataSource, UsersDataSource>
    with $Provider<UsersDataSource> {
  const UsersDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersDataSourceHash();

  @$internal
  @override
  $ProviderElement<UsersDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsersDataSource create(Ref ref) {
    return usersDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsersDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsersDataSource>(value),
    );
  }
}

String _$usersDataSourceHash() => r'0eee3a8a9286553aa82cc8eaccfd3b5da14b90ac';
