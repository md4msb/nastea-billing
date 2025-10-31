import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/extensions/src/nastea_text_styles.dart';
import 'package:nastea_billing/features/dashboard/presentation/widgets/dashboard_grid.dart';
import 'package:nastea_billing/features/dashboard/presentation/widgets/dashboard_items.dart';

import 'admin_app_shell.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFDFB),
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.teal,
              child: Text('A', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 8),
            Text(
              'Admin',
              style: NasteaTextStyles.heading(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xFFFBFDFB),
        elevation: 0,
      ),

      // 🌿 Main Content
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECTION 1: DASHBOARD GRID CARDS
            DashboardGrid(),

            const Gap(24),

            // SECTION 2: PENDING APPROVALS
            SectionHeader(
              title: 'Pending Approvals',
              actionText: 'View All',
              onActionTap: () {},
            ),
            const Gap(8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const PendingUserTile(name: 'Arjun P.', phone: '99282438'),
                  const PendingUserTile(name: 'Mishal K.', phone: '70523949'),
                ],
              ),
            ),

            const Gap(24),

            // SECTION 3: RECENT ITEMS
            SectionHeader(
              title: 'Recent Items',
              actionText: 'Add Product',
              onActionTap: () {},
            ),
            const Gap(8),
            DashboardItems(),
          ],
        ),
      ),
    );
  }
}
