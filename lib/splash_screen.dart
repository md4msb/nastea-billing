import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/features/auth/presentation/controller/auth_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 1)).then((_) {
        if (!context.mounted) {
          return;
        }
        _getCurrentUser(ref, context);
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/nastea_logo.png',
          height: 101,
          width: 180,
        ),
      ),
    );
  }

  void _getCurrentUser(WidgetRef ref, BuildContext context) async {
    final user = await ref.read(authProvider.notifier).getSignedInUser();
    if (!context.mounted) return;
    if (user != null) {
      context.goNamed(RouteNames.home);
    } else {
      context.goNamed(RouteNames.signInMethod);
    }
  }
}
