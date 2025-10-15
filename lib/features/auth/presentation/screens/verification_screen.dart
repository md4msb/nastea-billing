import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/extensions/nastea_text_styles.dart';

class VerificationScreen extends StatelessWidget {
  final String verificationId;

  const VerificationScreen({super.key, required this.verificationId});

  Future<void> verifyOtp(BuildContext context) async {
    String otp = "012388";
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      // Sign in the user with the credential
      await auth.signInWithCredential(credential);
      log('User signed in successfully');
    } catch (e) {
      log('[Auth error] ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    double availableWidth = screenWidth - 40 - 40;
    double boxWidth = (availableWidth / 6).round().toDouble();
    double boxHeight = (boxWidth / 0.887).round().toDouble();

    TextEditingController otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
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
                "We’ve sent an SMS with an activation code to your phone +91 9907883651",
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
          await verifyOtp(context);
        },
        backgroundColor: Color(0xFF46A56C),
        elevation: 2.5,
        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
      ),
    );
  }
}
