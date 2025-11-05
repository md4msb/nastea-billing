import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';

class ResendOtpButton extends HookWidget {
  const ResendOtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final remainingTime = useState(30);
    final isCounting = useState(true);

    useEffect(() {
      Timer? timer;
      if (isCounting.value) {
        timer = Timer.periodic(const Duration(seconds: 1), (t) {
          if (!context.mounted) return;

          if (remainingTime.value > 0) {
            remainingTime.value--;
          } else {
            isCounting.value = false;
            t.cancel();
          }
        });
      }
      return () => timer?.cancel();
    }, [isCounting.value]);

    Future<void> resendOtp() async {
      remainingTime.value = 30;
      isCounting.value = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NasteaText.body("Didn’t receive code? ", color: Colors.black54),
        GestureDetector(
          onTap: isCounting.value ? null : resendOtp,
          child: NasteaText.body(
            isCounting.value
                ? "Resend in ${remainingTime.value.toString().padLeft(2, '0')}"
                : "Resend OTP",
            color: isCounting.value ? Colors.black : const Color(0xFF46A56C),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
