import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import 'package:nastea_billing/features/dashboard/presentation/widgets/dashboard_grid.dart';
import 'package:nastea_billing/features/dashboard/presentation/widgets/dashboard_items.dart';
import '../../../../../core/configs/router-configs/router_names.dart';
import '../../widgets/pending_approvals_insight.dart';
import '../../widgets/section_header.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 253, 251, 1),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBFDFB),
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.teal,
              child: NasteaText.body('A', color: Colors.white),
            ),
            SizedBox(width: 8),
            NasteaText.heading('Admin', fontWeight: FontWeight.w600),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
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
            const PendingApprovalsInsight(),

            const Gap(24),

            // SECTION 3: RECENT ITEMS
            SectionHeader(
              title: 'Recent Items',
              actionText: 'Add Product',
              onTap: () => context.goNamed(RouteNames.itemCreate),
            ),
            const Gap(8),
            DashboardItems(),
          ],
        ),
      ),
    );
  }
}
