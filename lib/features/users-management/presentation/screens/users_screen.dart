import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../controllers/users_provider.dart';
import '../widgets/user_tile.dart';

class UsersScreen extends HookConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersProvider);

    return Scaffold(
      backgroundColor: Color(0xFFFBFDFB),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBFDFB),
        title: NasteaText.heading("Users", fontWeight: FontWeight.w600),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16,
          children: [
            CustomTextField(
              hintText: 'Search users…',
              fillColor: Colors.white,
              borderColor: Color(0xFFE8EDE7),
              borderRadius: 40,
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 12, right: 4),
                child: Icon(Icons.search, size: 22, color: Color(0xFF8B9D8A)),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: usersState.users.length,
              itemBuilder: (context, index) {
                final user = usersState.users[index];
                return UserTile(user: user);
              },
            ),
          ],
        ),
      ),
    );
  }
}
