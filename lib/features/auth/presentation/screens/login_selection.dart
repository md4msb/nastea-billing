import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.all(10),
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
              ..._getBrandingWigets(),
              _loginTypeBtn('Email', context),
              Gap(14),
              _loginTypeBtn('OTP', context),
              Gap(24),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getBrandingWigets() => [
    Image.asset('assets/images/nastea_logo.png', height: 101, width: 180),
    Gap(50),
    Text(
      'Elevate Every Move',
      style: NasteaTextStyles.title(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFF4D3E3E),
      ),
    ),
    Gap(16),
    Text(
      'Manage your Nastea business effortlessly\nfrom billing to delivery',
      textAlign: TextAlign.center,
      style: NasteaTextStyles.body(
        fontSize: 16,
        color: Color.fromARGB(179, 0, 0, 0),
      ),
    ),
    Gap(100),
  ];

  InkWell _loginTypeBtn(String type, BuildContext ctx) {
    return InkWell(
      onTap: () {
        if (type == 'Email') {
          ctx.pushNamed(RouteNames.adminLogin);
        } else {
          // Navigator.of(
          //   ctx,
          // ).push(MaterialPageRoute(builder: (context) => PhoneLoginScreen()));
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Color(0xFFD8DADC), width: 1),
        ),
        child: Row(
          children: [
            if (type == 'Email')
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
