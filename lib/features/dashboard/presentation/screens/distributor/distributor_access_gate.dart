import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import 'package:nastea_billing/features/auth/presentation/controller/auth_provider.dart';
import 'package:nastea_billing/features/dashboard/presentation/screens/distributor/distributor_home.dart';

class DistributorAccessGate extends HookConsumerWidget {
  const DistributorAccessGate({super.key});

  ///no_access
  ///requested
  ///approved

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessType = ref.watchCurrentUser?.appAccess ?? 'no_access';

    useEffect(() {
      if (accessType == 'approved' && context.mounted) {
        // context.goNamed(RouteNames.distributorHome);
      }
      return null;
    }, []);

    return (accessType == 'approved')
        ? DistributorHomeScreen()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: accessGateTemplate(accessType, ref),
            ),
          );
  }

  Column accessGateTemplate(String accessType, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Gap((accessType == 'requested') ? 80 : 40),
        Image.asset(
          height: 220,
          width: 220,
          (accessType == 'requested')
              ? 'assets/images/requested_access.webp'
              : 'assets/images/no_access.webp',
        ),
        Gap(40),
        NasteaText.body(
          (accessType == 'requested')
              ? 'Waiting for Approval'
              : "Access Required",
          fontWeight: FontWeight.w600,
          fontSize: 24,
          textAlign: TextAlign.center,
        ),
        Gap(25),
        NasteaText.body(
          (accessType == 'requested')
              ? "Your access request is under review.\nYou’ll be notified once the admin approves it."
              : "You currently don’t have access to the app.\nTap below to request access from the admin.",
          textAlign: TextAlign.center,
          color: Colors.black54,
        ),
        if (accessType == 'requested') Gap(20),
        if (accessType == 'requested')
          Container(
            height: 25,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Color(0xFFEEF7F1),

              borderRadius: BorderRadius.circular(100),
            ),

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  size: 16,
                  color: Color(0xFF36825F),
                ),
                Gap(8),
                NasteaText.body(
                  "Request Sent",
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF36825F),
                ),
              ],
            ),
          ),
        Gap(40),
        AppButton(
          backgroundColor: Color(0xFF46A56C),
          text: (accessType == 'requested')
              ? "Refresh Status"
              : "Request Access",
          onPressed: () {
            ref.read(authProvider.notifier).logOut();
          },
        ),
        Spacer(),
        Text.rich(
          textAlign: TextAlign.center,
          style: NasteaTextStyles.body(color: Color(0xFF000000).faded(0.7)),
          TextSpan(
            text: 'Need help? ',
            children: [
              TextSpan(
                style: NasteaTextStyles.body(
                  color: Color(0xFF46A56C),
                  fontWeight: FontWeight.w600,
                ),
                text: 'Contact Admin',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
