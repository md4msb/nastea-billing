import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/features/auth/presentation/controller/auth_provider.dart';
import 'package:nastea_billing/features/auth/presentation/screens/admin_login.dart';
import 'package:nastea_billing/features/auth/presentation/screens/login_selection.dart';
import 'package:nastea_billing/features/auth/presentation/screens/otp_screen.dart';
import 'package:nastea_billing/features/auth/presentation/screens/phone_login.dart';
import 'package:nastea_billing/features/auth/presentation/screens/settings_screen.dart';
import 'package:nastea_billing/features/dashboard/presentation/screens/admin/admin_app_shell.dart';
import 'package:nastea_billing/features/items/presentation/screens/items_screen.dart';
import 'package:nastea_billing/features/users/presentation/screens/users_screen.dart';
import 'package:nastea_billing/splash_screen.dart';
import '../../../features/dashboard/presentation/screens/admin/admin_home.dart';

part 'redirection.dart';
part 'refresh_listener.dart';

final routeProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/splash',
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text("Page not found"))),
    redirect: (context, state) => handleRedirection(state, ref),
    refreshListenable: _refreshListener(ref),
    routes: [
      //? ---- SPLASH SCREEN ----
      GoRoute(
        name: RouteNames.splash,
        path: '/splash',
        builder: (context, state) => SplashScreen(),
      ),

      /// -----------------------
      //? AUTH SCREENS
      /// -----------------------
      GoRoute(
        name: RouteNames.login,
        path: '/login',
        builder: (context, state) => LoginSelectionScreen(),
        routes: [
          //? ---- ADMIN LOGIN ----
          GoRoute(
            name: RouteNames.adminLogin,
            path: 'email',
            builder: (context, state) => const AdminLoginScreen(),
          ),

          //? ---- PHONE LOGIN ----
          GoRoute(
            name: RouteNames.phoneLogin,
            path: 'phone',
            builder: (context, state) => const PhoneLoginScreen(),
            routes: [
              //? ---- OTP VERIFICATION ----
              GoRoute(
                name: RouteNames.phoneOtp,
                path: 'otp',
                builder: (context, state) =>
                    const OtpScreen(verificationId: ''),
              ),
            ],
          ),
        ],
      ),

      /// -------------------------
      //? ADMIN APP SHELL ROUTER
      /// -------------------------
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AdminAppShell(navigationShell: navigationShell);
        },
        branches: [
          //? ----------- HOME TAB -----------
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.adminDashboard,
                path: '/dashboard',
                builder: (context, state) => const AdminHomeScreen(),
              ),
            ],
          ),

          //? ----------- ITEMS TAB -----------
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.items,
                path: '/items',
                builder: (context, state) => const ItemsScreen(),
                routes: [
                  // GoRoute(
                  //   name: RouteNames.itemForm,
                  //   path: 'form',
                  //   builder: (context, state) => const ItemFormScreen(),
                  // ),
                  // GoRoute(
                  //   name: RouteNames.itemEdit,
                  //   path: 'form/:id',
                  //   builder: (context, state) {
                  //     final id = state.pathParameters['id'];
                  //     return ItemFormScreen(itemId: id);
                  //   },
                  // ),
                ],
              ),
            ],
          ),

          //? ----------- USERS TAB -----------
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.users,
                path: '/users',
                builder: (context, state) => const UsersScreen(),
              ),
            ],
          ),

          //? ----------- SETTINGS TAB -----------
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.settings,
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);
