import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';

class AdminAppShell extends HookWidget {
  const AdminAppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void onTabTapped(int index) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = navigationShell.currentIndex;
    return Scaffold(
      backgroundColor: Color(0xFFFBFDFB),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFFFBFDFB),
        selectedIndex: selectedIndex,
        onDestinationSelected: onTabTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),

          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Products',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            label: 'Users',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onActionTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: NasteaTextStyles.body(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            actionText,
            style: NasteaTextStyles.body(
              color: Color(0xFF146356),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class PendingUserTile extends StatelessWidget {
  final String name;
  final String phone;

  const PendingUserTile({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFE6F4EA),
        child: Text(
          name[0],
          style: NasteaTextStyles.body(color: Color(0xFF146356)),
        ),
      ),
      title: Text(
        name,
        style: NasteaTextStyles.body(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      subtitle: Text(phone),
      trailing: Wrap(
        spacing: 8,
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.redAccent),
              foregroundColor: Colors.redAccent,
            ),
            child: const Text('Reject'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF146356),
              foregroundColor: Colors.white,
            ),
            child: const Text('Approve'),
          ),
        ],
      ),
    );
  }
}
