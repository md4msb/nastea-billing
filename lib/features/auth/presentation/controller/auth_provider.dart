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
      return AuthState.phoneNumberVerified(phoneNumber);
    });
  }

  Future<void> verifyOtp(String smsCode) async {
    final result = await _authRepo.logInWithPhoneNumber(
      _phoneVerificationId,
      smsCode,
    );
    if (result.isLeft()) {
      final error = result.fold((l) => l, (r) => null);
      state = AuthState.errorSigningInUser(error ?? "An error occured");
      return;
    }
    final user = await getSignedInUser();
    if (user == null) {
      state = AuthState.registerUser();
    }
  }

  Future<void> logOut() async {
    await _authRepo.logOut();
    state = const AuthState.initial();
  }
}


  // bool _validatePhoneNumber(String phone) {
  //   final regex = RegExp(r'^[0-9]{10}$');
  //   if (regex.hasMatch(phone)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }