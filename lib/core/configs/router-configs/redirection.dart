part of 'router.dart';

FutureOr<String?> handleRedirection(GoRouterState state, Ref ref) {
  final isLogin = state.matchedLocation == RouteNames.login;
  final isAdminLogin = state.matchedLocation == RouteNames.adminLogin;
  final isPhoneLogin = state.matchedLocation == RouteNames.phoneLogin;
  final isPhoneOtp = state.matchedLocation == RouteNames.phoneOtp;
  final isSplash = state.matchedLocation == RouteNames.splash;
  final isRegister = state.matchedLocation == RouteNames.registerUser;

  if (isLogin ||
      isAdminLogin ||
      isPhoneLogin ||
      isPhoneOtp ||
      isSplash ||
      isRegister) {
    return null;
  }

  // check if the user is logged in or not
  final isAuthenticated = _isAuthenticated(ref);
  if (!isAuthenticated) {
    return RouteNames.login;
  }

  return null;
}

bool _isAuthenticated(Ref ref) {
  final user = ref.readCurrentUser;
  return user != null;
}
