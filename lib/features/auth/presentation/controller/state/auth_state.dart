import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nastea_billing/core/domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';



@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  //// progress states
  const factory AuthState.signingInAdmin() = _SigningInAdmin;
  const factory AuthState.signingInUser() = _SigningInUser;
  const factory AuthState.gettingSignedInUser() = _GettingSignedInUser;
  const factory AuthState.verifyingPhoneNumber() = _VerifyingPhoneNumber;

  //// success states
  const factory AuthState.success(User user) = _Success;
  const factory AuthState.phoneNumberVerified(String phoneNumber) = _PhoneNumberVerified;
  const factory AuthState.registerUser() = _RegisterUser;


  //// error states
  const factory AuthState.errorSigningInAdmin(String message) = _ErrorSigningInAdmin;
  const factory AuthState.errorSigningInUser(String message) = _ErrorSigningInUser;
}
