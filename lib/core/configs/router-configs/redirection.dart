part of 'router.dart';

FutureOr<String?> handleRedirection(GoRouterState state, Ref ref) {
  final isSigninMethod = state.matchedLocation == RouteNames.signInMethod;
  final isAdminSignIn = state.matchedLocation == RouteNames.adminSignIn;
  final isPhoneSignIn = state.matchedLocation == RouteNames.phoneSignIn;
  final isOtpVerification = state.matchedLocation == RouteNames.otpVerification;
  final isSplashScreen = state.matchedLocation == RouteNames.splash;

  if (isSigninMethod ||
      isAdminSignIn ||
      isPhoneSignIn ||
      isOtpVerification ||
      isSplashScreen) {
    return null;
  }

  // check if the user is logged in or not
  final isAuthenticated = _isAuthenticated(ref);
  if (!isAuthenticated) {
    return RouteNames.signInMethod;
  }

  return null;
}

bool _isAuthenticated(Ref ref) {
  final user = ref.readCurrentUser;
  return user != null;
}
