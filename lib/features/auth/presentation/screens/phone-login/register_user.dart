import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/core/helpers/helpers.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../../controller/state/auth_state.dart';
import '../../controller/auth_provider.dart';
import '../../widgets/widgets.dart';

class RegisterUserScreen extends HookConsumerWidget {
  const RegisterUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();

    Future<void> submitName() async {
      final firstName = firstNameController.text.trim();
      // final lastName = lastNameController.text.trim();

      if (firstName.isEmpty || firstName.length < 3) {
        ErrorToaster.showError(
          context,
          message: "Please enter a valid first name.",
        );
        return;
      }
      await ref
          .read(authProvider.notifier)
          .registerUser(firstName);

      // if (smsCode.length == 6) {
      //   await ref.read(authProvider.notifier).verifyOtp(smsCode);
      // }
    }

    ref.listen(authProvider, (prev, next) {
      next.maybeWhen(
        errorSigningInUser: (message) =>
            ErrorToaster.showError(context, message: message),
        success: (user) => context.goNamed(RouteNames.distributorHome),
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              Icon(Icons.assignment_ind_rounded),
              Gap(20),
              NasteaText.heading("What's your name?", fontSize: 28),
              Gap(40),
              UnderlineTextField(
                controller: firstNameController,
                autofocus: true,
                keyboardType: TextInputType.name,
                hintText: 'First name (required)',
                hintStyle: NasteaTextStyles.body(
                  fontStyle: FontStyle.italic,
                  color: Colors.black45,
                ),
              ),
              Gap(30),
              UnderlineTextField(
                controller: lastNameController,
                keyboardType: TextInputType.name,
                hintText: 'Last name',
                hintStyle: NasteaTextStyles.body(
                  fontStyle: FontStyle.italic,
                  color: Colors.black45,
                ),
              ),
              Gap(20),
              NasteaText.body(
                'Last name is optional.',
                color: Color(0xFF7C7C7C),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitName,
        backgroundColor: Color(0xFF46A56C),
        elevation: 2.5,
        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
      ),
    );
  }
}
