import 'package:dartz/dartz.dart';
import 'package:nastea_billing/core/domain/entities/user_entity.dart';
import 'package:nastea_billing/core/handlers/error-handler/error_handler.dart';
import '../../domain/repositories/users_repo.dart';
import '../datasources/users_datasource.dart';

class UsersRepoImpl implements UsersRepo {
  final UsersDataSource usersDataSource;

  const UsersRepoImpl({required this.usersDataSource});

  @override
  Future<Either<String, List<User>>> getAllUsers() async {
    try {
      final users = await usersDataSource.getAllUsers();
      return Right(users);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> updateUserRole(String id, String role) async {
    try {
      await usersDataSource.updateUserRole(id, role);
      return Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> deleteUser(String id) async {
    try {
      await usersDataSource.deleteUser(id);
      return Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
