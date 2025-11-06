import 'package:dartz/dartz.dart';
import '../entities/user.dart';

abstract class AuthRepo {
  Future<Either<String, User>> logInWithEmailAndPassword(String email, String password);

  Future<Either<String, String>> verifyPhoneNumber(String phoneNumber);
  Future<Either<String, Unit>> logInWithPhoneNumber(String verificationId, String smsCode);
  bool checkUserAuthenticated();

  Future<Either<String, User>> registerUser(String displaName);

  Future<Either<String, User>> getLoggedInUser();

  Future<Either<String, Unit>> logOut();
}
