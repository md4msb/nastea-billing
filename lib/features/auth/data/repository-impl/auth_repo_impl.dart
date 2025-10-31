import 'package:dartz/dartz.dart';
import 'package:nastea_billing/core/handlers/error-handler/error_handler.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;

  const AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<String, User>> getLoggedInUser() async {
    try {
      final user = await authDataSource.getLoggedInUser();
      return Right(user);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, User>> logInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await authDataSource.logInWithEmailAndPassword(email, password);
      final fetchedUser = await authDataSource.getLoggedInUser();

      return Right(fetchedUser);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> verifyPhoneNumber(String phoneNumber) async {
    try {

      // await authDataSource.
      return Right(unit);


    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, User>> logInWithPhoneNumber(
    String verificationId,
    String smsCode,
  ) async {
    try {
      await authDataSource.logInWithPhoneNumber(verificationId, smsCode);
      final fetchedUser = await authDataSource.getLoggedInUser();

      return Right(fetchedUser);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> logOut() async {
    try {
      await authDataSource.logOut();
      return Right(unit);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
