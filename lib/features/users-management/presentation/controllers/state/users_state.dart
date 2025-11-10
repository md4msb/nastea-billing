import 'package:nastea_billing/core/domain/entities/user_entity.dart';

class UsersState {
  final List<User> users;
  final bool isLoading;
  final String? error;

  const UsersState({required this.users, required this.isLoading, this.error});

  factory UsersState.initial() => const UsersState(users: [], isLoading: false);

  UsersState copyWith({
    List<User>? users,
    bool? isLoading,
    String? error,
  }) {
    return UsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
