import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nastea_billing/core/configs/router-configs/router_names.dart';
import 'package:nastea_billing/core/extensions/nastea_text_styles.dart';
import 'package:nastea_billing/core/helpers/helpers.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';
import '../controller/state/auth_state.dart';
import '../controller/auth_provider.dart';
import '../widgets/widgets.dart';

class AdminSignInScreen extends HookConsumerWidget {
  const AdminSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isPasswordVisible = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    Future<void> onAdminSignIn() async {
      await ref
          .read(authProvider.notifier)
          .adminSignIn(emailController.text, passwordController.text);
    }

    ref.listen(authProvider, (prev, next) {
      next.maybeWhen(
        errorSigningInAdmin: (message) {
          ErrorToaster.showError(context, message: message);
        },
        success: (user) {
          context.goNamed(RouteNames.home);
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

                Text(
                  'Sign in to access your order history and get real-time updateson all your shipments',
                  textAlign: TextAlign.start,
                  style: NasteaTextStyles.body(
                    fontSize: 14,
                    color: Color(0xFFA6A4AD),
                  ),
                ),

                Gap(22),

                Text('Email address', style: NasteaTextStyles.body()),

                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  maxLines: 1,
                  fillColor: Colors.white,
                  topMargin: 6,
                ),

                Gap(10),

                Text('Password', style: NasteaTextStyles.body()),

                CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  maxLines: 1,
                  fillColor: Colors.white,
                  obscureText: isPasswordVisible.value,
                  topMargin: 6,
                ),
                Gap(3),
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
          child: Text(
            'Forgot password?',
            style: NasteaTextStyles.body(fontSize: 14),
          ),
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
