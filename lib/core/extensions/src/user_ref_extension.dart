import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/features/auth/presentation/controller/auth_provider.dart';
import 'package:nastea_billing/features/auth/presentation/controller/state/auth_state.dart';
import '../../domain/entities/user_entity.dart';

extension UserRefExtension on Ref {
  User? get watchCurrentUser =>
      watch(authProvider).mapOrNull(success: (result) => result.user);

  User? get readCurrentUser =>
      read(authProvider).mapOrNull(success: (result) => result.user);
}

extension UserWidgetRefExtension on WidgetRef {
  User? get watchCurrentUser =>
      watch(authProvider).mapOrNull(success: (result) => result.user);

  User? get readCurrentUser =>
      read(authProvider).mapOrNull(success: (result) => result.user);
}
