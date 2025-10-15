import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/extensions/nastea_text_styles.dart';
import 'package:nastea_billing/features/auth/presentation/screens/phone_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFFF0FFF6),
            border: Border.all(color: Color(0xFF006838), width: 0.5),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _loginTypeBtn('Google', context),
              _loginTypeBtn('OTP', context),
              Gap(25),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _loginTypeBtn(String type, BuildContext ctx) {
    return InkWell(
      onTap: () {
        Navigator.of(
          ctx,
        ).push(MaterialPageRoute(builder: (context) => PhoneLoginScreen()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Color(0xFFD8DADC), width: 1),
        ),
        child: Row(
          children: [
            if (type == 'Google')
              SvgPicture.asset('assets/images/google_logo.svg')
            else
              SvgPicture.asset('assets/images/message_icon.svg'),
            Gap(15),
            Text(
              'Login with $type',
              style: NasteaTextStyles.body(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF46A56C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
