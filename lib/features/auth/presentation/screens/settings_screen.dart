import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nastea_billing/features/auth/presentation/controller/auth_provider.dart';

import '../../../../core/widgets/widgets.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: AppButton(onPressed: () {
            ref.read(authProvider.notifier).logOut();
          }, text: "Logout"),
        ),
      ),
    );
  }
}
