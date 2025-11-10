import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import 'package:nastea_billing/features/users-management/presentation/controllers/users_provider.dart';
import '../../../items/presentation/controller/items_provider.dart';

class DashboardGrid extends HookConsumerWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsState = ref.watch(itemsProvider);
    final usersState = ref.watch(usersProvider);

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.28,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        DashboardCard(
          onTap: () => context.goNamed(RouteNames.users),
          icon: Icons.people_outline,
          label: 'Users',
          value: (usersState.users.length.toString()),
          backgroundColor: Color(0xFF46A56C).faded(0.8),
          foregroundColor: Colors.white,
        ),
        DashboardCard(
          icon: Icons.pending_actions_outlined,
          label: 'Pending Actions',
          value: '2',
          backgroundColor: Color(0xFF795548).faded(0.7),
          foregroundColor: Colors.white,
        ),
        DashboardCard(
          onTap: () => context.goNamed(RouteNames.items),
          icon: Icons.inventory_2_outlined,
          label: 'Products',
          value: (itemsState.items.length).toString(),
          backgroundColor: Color(0xFFC7F279).faded(0.8),
          foregroundColor: Color(0xFF2A2924).blendWith(Color(0xFFC7F279), 0.85),
        ),
        DashboardCard(
          icon: Icons.receipt_long_outlined,
          label: 'Total Bills',
          value: '13',
          backgroundColor: Color(0xFFFFF8E1),
          foregroundColor: Color(0xFF795548).blendWith(Color(0xFFFFF8E1), 0.9),
        ),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color backgroundColor;
  final Color foregroundColor;
  final Function()? onTap;

  const DashboardCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.backgroundColor,
    required this.foregroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(7),
            Icon(icon, color: foregroundColor, size: 26),
            const Gap(8),
            NasteaText.body(
              value,
              color: foregroundColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
            const Spacer(),
            NasteaText.body(
              label,
              color: foregroundColor,
              fontWeight: FontWeight.w500,
            ),
            const Gap(2),
          ],
        ),
      ),
    );
  }
}
