import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/domain/entities/user_entity.dart';
import 'package:nastea_billing/features/users-management/presentation/widgets/user_tile.dart';
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
          title: 'Access Requests',
          actionText: 'View All',
          onTap: () => context.goNamed(RouteNames.users),
        ),
        const Gap(8),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: usersCount,
          itemBuilder: (context, index) {
            final user = usersState.users[index];
            return UserTile(user: user, type: DispType.dashboard);
          },
        ),
      ],
    );
  }
}
