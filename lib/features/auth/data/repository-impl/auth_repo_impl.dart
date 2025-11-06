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
  Future<Either<String, String>> verifyPhoneNumber(String phoneNumber) async {
    try {
      final result = await authDataSource.verifyPhoneNumber(phoneNumber);
      return Right(result);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Unit>> logInWithPhoneNumber(
    String verificationId,
    String smsCode,
  ) async {
    try {
      await authDataSource.logInWithPhoneNumber(verificationId, smsCode);
      return Right(unit);
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

  @override
  bool checkUserAuthenticated() {
    return authDataSource.checkUserAuthenticated();
  }

  @override
  Future<Either<String, User>> registerUser(String displayName) async {
    try {
      await authDataSource.registerUser(displayName);
      final fetchedUser = await authDataSource.getLoggedInUser();
      return Right(fetchedUser);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
