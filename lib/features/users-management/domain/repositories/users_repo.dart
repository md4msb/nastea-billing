import 'package:dartz/dartz.dart';
import 'package:nastea_billing/core/domain/entities/user_entity.dart';

abstract class UsersRepo {
  Future<Either<String, List<User>>> getAllUsers();
  Future<Either<String, Unit>> updateUserRole(String id, String role);
  Future<Either<String, Unit>> deleteUser(String id);
}
