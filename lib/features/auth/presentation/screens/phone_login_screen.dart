import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/extensions/nastea_text_styles.dart';
import 'package:nastea_billing/features/auth/presentation/screens/verification_screen.dart';

class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Gap(30),
              Icon(Icons.phone),
              Gap(20),
              Text(
                "What's your phone \nnumber?",
                style: NasteaTextStyles.heading(fontSize: 28),
              ),
              Gap(40),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+91',
                        style: NasteaTextStyles.body(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(2),
                      Container(height: 1, width: 45, color: Colors.black),
                    ],
                  ),
                  Gap(20),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      maxLines: 1,
                      maxLength: 10,
                      autofocus: true,
                      cursorColor: Colors.black,
                      cursorHeight: 26,
                      cursorWidth: 1.5,
                      style: NasteaTextStyles.body(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        constraints: BoxConstraints(maxHeight: 36),
                        counterText: '',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20),
              Text(
                'Nastea will send you a text with a verification code.\nMessage and data rates may apply.',
                style: NasteaTextStyles.body(
                  fontSize: 14,
                  color: Color(0xFF7C7C7C),
                ),
              ),
              Gap(30),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await submitPhoneNumber(context);
          Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                VerificationScreen(verificationId: ''),
          ),
        );
        },
        backgroundColor: Color(0xFF46A56C),
        elevation: 2.5,
        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
      ),
    );
  }

  Future<void> submitPhoneNumber(BuildContext context) async {
    String phoneNumber = "+917902882888";
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {       
      },
      verificationFailed: (FirebaseAuthException e) {
        log('[Auth error] ${e.message.toString()}');
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                VerificationScreen(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
