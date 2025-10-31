import '../../domain/entities/user.dart';

abstract class AuthDataSource {
  Future<void> logInWithEmailAndPassword(String email, String password);
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<void> logInWithPhoneNumber(String verificationId, String smsCode);
  Future<User> getLoggedInUser();
  Future<void> logOut();
}
