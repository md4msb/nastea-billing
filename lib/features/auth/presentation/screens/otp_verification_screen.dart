import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/features/auth/presentation/controller/auth_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/extensions/nastea_text_styles.dart';
import '../widgets/auth_appbar.dart';

class OtpVerificationScreen extends HookConsumerWidget {
  final String verificationId;

  const OtpVerificationScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final phoneNumber =  ref.watch(authProvider)?.phoneNumber;
    double screenWidth = useMemoized(() => MediaQuery.of(context).size.width);
    double availableWidth = useMemoized(() => screenWidth - 40 - 40);
    double boxWidth = useMemoized(
      () => (availableWidth / 6).round().toDouble(),
    );
    double boxHeight = useMemoized(() => (boxWidth / 0.887).round().toDouble());

    final otpController = useTextEditingController();

    Future<void> submitOtp() async {
      String smsCode = otpController.text.trim();

      if (smsCode.length == 6) {
        ref
            .read(authProvider.notifier)
            .verifyOtp(verificationId: verificationId, smsCode: smsCode);
      } else {
        //todo
        log('[input error] please enter valid 6 digit opt');
      }
    }

    return Scaffold(
      appBar: AuthAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(25),

              Icon(Icons.security_rounded),

              Gap(15),

              // Title
              Text(
                "Enter your verification \ncode",
                style: NasteaTextStyles.heading(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Gap(40),

              // Subtitle
              Text(
                "We’ve sent an SMS with an activation code to your phone phoneNumber", //todo disp dynamic phone number
                style: NasteaTextStyles.body(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              Gap(20),

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
                  borderWidth: 1,
                  activeBorderWidth: 1,
                  selectedBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  errorBorderWidth: 1,
                  inactiveColor: Color(0xFFD8DADC),
                  selectedColor: Colors.black,
                  activeColor: Colors.black,
                ),
                onChanged: (value) {},
              ),

              Gap(20),
              // Resend code text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Send code again ",
                    style: NasteaTextStyles.body(color: Colors.black54),
                  ),
                  Text(
                    "00:20",
                    style: NasteaTextStyles.body(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await submitOtp();
        },
        backgroundColor: Color(0xFF46A56C),
        elevation: 2.5,
        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
      ),
    );
  }
}
