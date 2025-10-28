import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/user_ref_extension.dart';
import 'package:nastea_billing/features/auth/presentation/controller/auth_provider.dart';
import 'package:nastea_billing/features/auth/presentation/screens/admin_signin_screen.dart';
import 'package:nastea_billing/features/auth/presentation/screens/login_method_screen.dart';
import 'package:nastea_billing/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:nastea_billing/features/auth/presentation/screens/phone_login_screen.dart';
import 'package:nastea_billing/features/home_gate.dart';
import 'package:nastea_billing/splash_screen.dart';
part 'redirection.dart';
part 'refresh_listener.dart';

final routeProvider = Provider(
  (ref) => GoRouter(
    initialLocation: RouteNames.splash,

    errorBuilder: (context, state) {
      return const Scaffold(body: Center(child: Text("Page not found")));
    },

    redirect: (context, state) => handleRedirection(state, ref),
    refreshListenable: _refreshListener(ref),
    routes: [
      GoRoute(
        name: RouteNames.splash,
        path: '/splash-screen',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: RouteNames.signInMethod,
        path: '/sign-in-method',
        builder: (context, state) => LoginMethodScreen(),
      ),
      GoRoute(
        name: RouteNames.adminSignIn,
        path: '/admin-sign-in',
        builder: (context, state) => AdminSignInScreen(),
      ),
      GoRoute(
        name: RouteNames.phoneSignIn,
        path: '/phone-number-sign-in',
        builder: (context, state) => PhoneLoginScreen(),
      ),
      GoRoute(
        name: RouteNames.otpVerification,
        path: '/otp-verification',
        builder: (context, state) => OtpVerificationScreen(verificationId: ''), //todo pass the verification ID
      ),
      GoRoute(
        name: RouteNames.home,
        path: '/',
        builder: (context, state) => HomeGate(),
      ),
    ],
  ),
);
