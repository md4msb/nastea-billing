import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/extensions.dart';
import 'package:nastea_billing/core/helpers/helpers.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../controller/state/auth_state.dart';
import '../controller/auth_provider.dart';
import '../widgets/widgets.dart';

class AdminLoginScreen extends HookConsumerWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isPasswordVisible = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    Future<void> onAdminSignIn() async {
      await ref
          .read(authProvider.notifier)
          .adminSignIn(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
    }

    ref.listen(authProvider, (prev, next) {
      next.maybeWhen(
        errorSigningInAdmin: (message) {
          ErrorToaster.showError(context, message: message);
        },
        success: (_) {
          context.goNamed(RouteNames.adminDashboard);
        },
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthAppBar(),
      body: AnimatedAuthBody(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(60),
                _buildGreetingText(),
                Gap(30),

                NasteaText.body(
                  'Sign in to access your order history and get real-time updateson all your shipments',
                  textAlign: TextAlign.start,
                  color: Color(0xFFA6A4AD),
                ),

                Gap(22),

                NasteaText.body('Email address'),

                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  maxLines: 1,
                  fillColor: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 8),
                ),

                Gap(14),

                NasteaText.body('Password'),

                CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  maxLines: 1,
                  fillColor: Colors.white,
                  obscureText: isPasswordVisible.value,
                  margin: EdgeInsets.only(top: 8, bottom: 15),
                ),

                _buildPasswordResetButton(onPressed: () {}),
                Gap(40),
                AppButton(
                  onPressed: onAdminSignIn,
                  text: 'Sign In',
                  backgroundColor: Color(0xFF46A56C),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordResetButton({
    required FutureOr<void> Function()? onPressed,
  }) {
    return Align(
      alignment: Alignment.centerRight,
      child: IntrinsicWidth(
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero, // remove internal padding
            minimumSize: Size.zero, // remove min tap target size
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // shrink hitbox
          ),
          child: NasteaText.body('Forgot password?'),
        ),
      ),
    );
  }

  Text _buildGreetingText() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Welcome\n',
            style: NasteaTextStyles.heading(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF46A56C),
            ),
          ),
          TextSpan(
            text: 'back!',
            style: NasteaTextStyles.heading(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.start,
    );
  }
}
