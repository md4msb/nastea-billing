import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/helpers/helpers.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../../widgets/widgets.dart';
import '../../controller/state/auth_state.dart';
import '../../controller/auth_provider.dart';

class PhoneLoginScreen extends HookConsumerWidget {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();

    Future<void> submitPhoneNumber() async {
      final phoneNumber = phoneController.text.trim();
      if (phoneNumber.isNotEmpty) {
        await ref
            .read(authProvider.notifier)
            .verifyPhoneNumber("+91$phoneNumber");
      }
    }

    ref.listen(authProvider, (prev, next) {
      next.maybeWhen(
        errorSigningInUser: (message) =>
            ErrorToaster.showError(context, message: message),
        phoneNumberVerified: () => context.goNamed(RouteNames.phoneOtp),
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Icon(Icons.phone),
              Gap(20),
              NasteaText.heading("What's your phone \nnumber?", fontSize: 28),
              Gap(40),
              _buildPhoneNumberTextField(phoneController),
              Gap(20),
              NasteaText.body(
                'Nastea will send you a text with a verification code. Message and data rates may apply.',
                color: Color(0xFF7C7C7C),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitPhoneNumber,
        backgroundColor: Color(0xFF46A56C),
        elevation: 2.5,
        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
      ),
    );
  }

  Widget _buildPhoneNumberTextField(TextEditingController phoneController) {
    return Row(
      children: [
        SizedBox(
          width: 45,
          child: UnderlineTextField(
            readOnly: true,
            canRequestFocus: false,
            initialValue: '+91',
            hintText: '+91',
          ),
        ),
        Gap(20),
        Expanded(
          child: UnderlineTextField(
            controller: phoneController,
            autofocus: true,
            keyboardType: TextInputType.phone,
            maxLength: 10,
          ),
        ),
      ],
    );
  }
}
