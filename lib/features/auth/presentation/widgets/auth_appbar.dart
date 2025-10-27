import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: SizedBox.shrink(),
      actions: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.close),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
