import '../../domain/entities/user.dart';

abstract class AuthDataSource {
  Future<void> logInWithEmailAndPassword(String email, String password);

  Future<String> verifyPhoneNumber(String phoneNumber);
  Future<void> logInWithPhoneNumber(String verificationId, String smsCode);
  bool checkUserAuthenticated();
  Future<void> registerUser(String displayName);
  Future<User> getLoggedInUser();
  Future<void> logOut();
}
