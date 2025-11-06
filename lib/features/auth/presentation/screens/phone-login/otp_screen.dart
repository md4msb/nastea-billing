import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import 'package:nastea_billing/features/auth/presentation/controller/auth_provider.dart';
import 'package:nastea_billing/features/auth/presentation/controller/state/auth_state.dart';
import 'package:nastea_billing/features/auth/presentation/widgets/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/helpers/helpers.dart';

class OtpScreen extends HookConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpController = useTextEditingController();

    final phoneNumber = ref
        .read(authProvider)
        .mapOrNull(phoneNumberVerified: (value) => value.phoneNumber);

    Future<void> submitSmsCode() async {
      final smsCode = otpController.text.trim();
      if (smsCode.length == 6) {
        await ref.read(authProvider.notifier).verifyOtp(smsCode);
      }
    }

    ref.listen(authProvider, (prev, next) {
      next.maybeWhen(
        errorSigningInUser: (message) =>
            ErrorToaster.showError(context, message: message),
        registerUser: () => context.goNamed(RouteNames.registerUser),
        success: (user) => context.goNamed(RouteNames.distributorHome),
        orElse: () {},
      );
    });

    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth - 50 - 40;
    final boxWidth = (availableWidth / 6).round().toDouble();
    final boxHeight = (boxWidth / 0.887).round().toDouble();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(25),
              const Icon(Icons.security_rounded),
              const Gap(15),
              NasteaText.heading(
                "Enter your verification \ncode",
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              const Gap(40),
              NasteaText.body(
                "We’ve sent an SMS with an activation code to your phone $phoneNumber",
                color: Colors.black54,
              ),
              const Gap(20),

              // OTP input
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: otpController,
                keyboardType: TextInputType.number,
                showCursor: false,
                textStyle: NasteaTextStyles.body(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15),
                  fieldHeight: boxHeight,
                  fieldWidth: boxWidth,
                  selectedBorderWidth: 1.2,
                  activeBorderWidth: 1.2,
                  inactiveBorderWidth: 1,
                  activeColor: Colors.black87,
                  inactiveColor: const Color(0xFFD8DADC),
                  selectedColor: Colors.black87,
                ),
                autoDisposeControllers: false,
              ),
              const Gap(20),
              ResendOtpButton(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitSmsCode,
        backgroundColor: const Color(0xFF46A56C),
        elevation: 2.5,
        child: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
      ),
    );
  }
}
