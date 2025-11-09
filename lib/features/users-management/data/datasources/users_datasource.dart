import 'package:nastea_billing/core/domain/entities/user_entity.dart';

abstract class UsersDataSource {
  Future<List<User>> getAllUsers();
  Future<void> updateUserRole(String id, String role);
  Future<void> deleteUser(String id);
}
