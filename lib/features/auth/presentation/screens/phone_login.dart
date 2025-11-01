import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import 'package:nastea_billing/features/auth/presentation/widgets/auth_appbar.dart';

class PhoneLoginScreen extends HookConsumerWidget {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();

    // Future<void> submitPhoneNumber() async {
    //   try {
    //     await ref
    //         .read(authProvider.notifier)
    //         .submitPhoneNumber(
    //           phoneNumber: phoneController.text.trim(),
    //           codeSent: (String verificationId, int? resendToken) {
    //             Navigator.of(context).push(
    //               MaterialPageRoute(
    //                 builder: (context) => VerificationScreen(verificationId: verificationId),
    //               ),
    //             );
    //           },
    //         );
    //   } on FirebaseAuthException catch (e) {
    //     dispSnackBar(e.message ?? 'Firebase error occurred.');
    //   } catch (e) {
    //     dispSnackBar(e.toString().replaceAll('Exception: ', ''));
    //   }
    // }

    return Scaffold(
      appBar: AuthAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Icon(Icons.phone),
              Gap(20),
              NasteaText.heading("What's your phone \nnumber?", fontSize: 28),
              Gap(40),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NasteaText.body(
                        '+91',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(2),
                      Container(height: 1, width: 45, color: Colors.black),
                    ],
                  ),
                  Gap(20),
                  Expanded(
                    child: TextFormField(
                      controller: phoneController,
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
              NasteaText.body(
                'Nastea will send you a text with a verification code. Message and data rates may apply.',
                fontSize: 14,
                color: Color(0xFF7C7C7C),
              ),
              Gap(30),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await submitPhoneNumber();
        },
        backgroundColor: Color(0xFF46A56C),
        elevation: 2.5,
        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
      ),
    );
  }
}


    // void dispSnackBar(String message) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         message,
    //         style: NasteaTextStyles.body(
    //           fontSize: 14,
    //           color: Color(0xFF795548),
    //         ),
    //       ),
    //       behavior: SnackBarBehavior.floating,
    //       backgroundColor: Color(0xFFFFF8E1),
    //       elevation: 4,
    //     ),
    //   );
    // }