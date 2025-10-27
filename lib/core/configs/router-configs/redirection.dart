part of 'router.dart';

FutureOr<String?> handleRedirection(GoRouterState state, Ref ref) {
  final isSigninMethod = state.matchedLocation == RouteNames.signInMethod;
  final isSignInAdmin = state.matchedLocation == RouteNames.adminSignIn;
  final isPhoneSignIn = state.matchedLocation == RouteNames.phoneSignIn;
  final isOtpVerification = state.matchedLocation == RouteNames.otpVerification;
  final isSplashScreen = state.matchedLocation == RouteNames.splash;

  if (isSigninMethod ||
      isSignInAdmin ||
      isPhoneSignIn ||
      isOtpVerification ||
      isSplashScreen) {
    return null;
  }

  // check if the user is logged in or not
  final isAuthenticated = _isAuthenticated(ref);
  if (!isAuthenticated) {
    return "/sign-in";
  }

  return null;
}

bool _isAuthenticated(Ref ref) {
  final user = ref
      .read(authProvider)
      .maybeMap(success: (user) => user, orElse: () => null);
  return user != null;
}
