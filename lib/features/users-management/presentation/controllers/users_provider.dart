import 'package:nastea_billing/core/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/users_repo.dart';
import '../di/injection.dart';
import 'state/users_state.dart';

part 'users_provider.g.dart';

@Riverpod(keepAlive: true)
class UsersNotifier extends _$UsersNotifier {
  late final UsersRepo _usersRepo;
  List<User> _cachedUsers = [];

  @override
  UsersState build() {
    _usersRepo = ref.read(usersRepoProvider);
    Future.microtask(() => loadUsers(useLoading: true));
    return UsersState.initial();
  }

  Future<void> loadUsers({bool useLoading = false}) async {
    if (useLoading) state = state.copyWith(isLoading: true, error: null);

    final result = await _usersRepo.getAllUsers();

    state = result.fold(
      (error) => state.copyWith(isLoading: false, error: error),
      (items) {
        _cachedUsers = items;
        return UsersState(users: _cachedUsers, isLoading: false);
      },
    );
  }
}
