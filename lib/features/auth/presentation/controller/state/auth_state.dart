import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user.dart';
part 'auth_state.freezed.dart';



@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  //// progress states
  const factory AuthState.signingInAdmin() = _SigningInAdmin;
  const factory AuthState.signingInUser() = _SigningInUser;
  const factory AuthState.gettingSignedInUser() = _GettingSignedInUser;
  //// success states
  const factory AuthState.success(User user) = _Success;
  //// error states
  const factory AuthState.errorSigningInAdmin(String message) = _ErrorSigningInAdmin;
  const factory AuthState.errorSigningInUser(String message) = _ErrorSigningInSigningInUser;
}
