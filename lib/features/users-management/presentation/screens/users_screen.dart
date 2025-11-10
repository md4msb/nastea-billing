import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../controllers/users_provider.dart';

class UsersScreen extends HookConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.read(usersProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: usersState.users.length,
        itemBuilder: (context, index) {
          final user = usersState.users[index];
          return ListTile(title: NasteaText.body(user.name));
        },
      ),
    );
  }
}
