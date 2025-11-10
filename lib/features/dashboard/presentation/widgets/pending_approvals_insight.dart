import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/domain/entities/user_entity.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../../../users-management/presentation/controllers/users_provider.dart';
import 'section_header.dart';

class PendingApprovalsInsight extends HookConsumerWidget {
  const PendingApprovalsInsight({super.key});

  int _getUsersCount(List<User> items) {
    return items.length < 2 ? items.length : 2;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersProvider);
    int usersCount = _getUsersCount(usersState.users);
    return Column(
      children: [
        SectionHeader(
          title: 'Pending Approvals',
          actionText: 'View All',
          onTap: () => context.goNamed(RouteNames.users),
        ),
        const Gap(8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: usersCount,
            itemBuilder: (context, index) {
              final user = usersState.users[index];
              return PendingUserTile(name: user.name, phone: user.phoneNumber);
            },
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
        child: NasteaText.body(name[0], color: Color(0xFF146356)),
      ),
      title: NasteaText.body(name, fontWeight: FontWeight.w600, fontSize: 14),
      subtitle: NasteaText.body(phone, fontSize: 12,),
      // trailing: Wrap(
      //   spacing: 8,
      //   children: [
      //     OutlinedButton(
      //       onPressed: () {},
      //       style: OutlinedButton.styleFrom(
      //         side: const BorderSide(color: Colors.redAccent),
      //         foregroundColor: Colors.redAccent,
      //       ),
      //       child: NasteaText.body('Reject'),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {},
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: const Color(0xFF146356),
      //         foregroundColor: Colors.white,
      //       ),
      //       child: NasteaText.body('Approve'),
      //     ),
      //   ],
      // ),
    
    
    );
  }
}
