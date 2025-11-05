import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user.dart';
import 'state/auth_state.dart';
import '../../domain/repositories/auth_repo.dart';
import '../di/injection.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepo _authRepo;

  late String _phoneVerificationId;

  @override
  AuthState build() {
    _authRepo = ref.read(authRepositoryProvider);
    getSignedInUser(useLoading: true);
    return AuthState.initial();
  }

  Future<User?> getSignedInUser({bool useLoading = false}) async {
    if (useLoading) state = AuthState.gettingSignedInUser();
    final result = await _authRepo.getLoggedInUser();
    return result.fold((error) => null, (user) {
      state = AuthState.success(user);
      return user;
    });
  }

  Future<void> adminSignIn(String email, String password) async {
    state = const AuthState.signingInAdmin();

    final result = await _authRepo.logInWithEmailAndPassword(email, password);

    state = result.fold(
      (error) => AuthState.errorSigningInAdmin(error),
      (user) => AuthState.success(user),
    );
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    state = const AuthState.verifyingPhoneNumber();

    final result = await _authRepo.verifyPhoneNumber(phoneNumber);

    state = result.fold((error) => AuthState.errorSigningInUser(error), (id) {
      _phoneVerificationId = id;
      return AuthState.phoneNumberVerified();
    });
  }

  // bool _validatePhoneNumber(String phone) {
  //   final regex = RegExp(r'^[0-9]{10}$');
  //   if (regex.hasMatch(phone)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<void> submitPhoneNumber({
  //   required String phoneNumber,
  //   required void Function(String, int?) codeSent,
  // }) async {
  //   if (!_validatePhoneNumber(phoneNumber)) {
  //     // Make sure this runs asynchronously
  //     await Future.delayed(Duration.zero);
  //     throw Exception('Please enter a valid 10-digit phone number.');
  //   }
  //   try {
  //     await _auth
  //         .verifyPhoneNumber(
  //           phoneNumber: '+91$phoneNumber',
  //           verificationCompleted: (PhoneAuthCredential credential) {},
  //           verificationFailed: (FirebaseAuthException e) {
  //             throw FirebaseAuthException(code: e.code, message: e.message);
  //           },
  //           codeSent: codeSent,
  //           codeAutoRetrievalTimeout: (String verificationId) {},
  //         )
  //         .then((v) {
  //           state = User(id: '', phoneNumber: '+91 $phoneNumber');
  //         });
  //   } on FirebaseAuthException catch (_) {
  //     rethrow;
  //   } catch (_) {
  //     // Catch all unexpected errors
  //     throw Exception('Something went wrong. Please try again.');
  //   }
  // }

  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    final result = await _authRepo.logInWithPhoneNumber(
      verificationId,
      smsCode,
    );

    result.fold(
      (error) => AuthState.errorSigningInUser(error),
      (user) => AuthState.success(user),
    );
    // try {
    //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: verificationId,
    //     smsCode: smsCode,
    //   );

    //   // Sign in the user with the credential
    //   var result = await _auth.signInWithCredential(credential);
    //   final fbUser = result.user;
    //   if (fbUser != null) {
    //     log('[phone Auth] success');
    //     final fbUser = result.user;
    //     state = User(
    //       id: fbUser!.uid,
    //       phoneNumber: fbUser.phoneNumber ?? '',
    //       name: fbUser.displayName,
    //       isAuthenticated: true,
    //     );
    //   }
    // } catch (e) {
    //   log('[Auth error] ${e.toString()}');
    // }
  }

  Future<void> logOut() async {
    await _authRepo.logOut();
    state = const AuthState.initial();
  }
}
