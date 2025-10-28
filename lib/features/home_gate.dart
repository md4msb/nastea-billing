import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nastea_billing/core/extensions/user_ref_extension.dart';

import 'admin_home.dart';
import 'distributor_home.dart';

class HomeGate extends ConsumerWidget {
  const HomeGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.readCurrentUser;

    if (user?.role == 'admin') {
      return const AdminHomeScreen();
    } else {
      return const DistributorHomeScreen();
    }
  }
}
