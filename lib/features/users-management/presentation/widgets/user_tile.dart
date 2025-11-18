import 'package:flutter/material.dart';
import 'package:nastea_billing/core/domain/entities/user_entity.dart';
import 'package:nastea_billing/core/widgets/widgets.dart';

class UserTile extends StatelessWidget {
  final User user;
  final DispType? type;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const UserTile({
    super.key,
    required this.user,
    this.type = DispType.list,
    this.onAccept,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xFFFFFEF5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFF5E9C8)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [Color(0xFFF9E8B8), Color(0xFFF5DDA0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: NasteaText.body(
              user.name[0],
              color: const Color(0xFF8B7355),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        title: NasteaText.body(user.name, fontWeight: FontWeight.w500),
        subtitle: NasteaText.body(user.phoneNumber, color: Color(0xFF6B7A6A)),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: CircleBorder(),
                side: const BorderSide(color: Color(0xFFD77676)),
                foregroundColor: Color(0xFFD77676),
                backgroundColor: Colors.white,
              ),
              child: Icon(Icons.close, size: 16),
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                backgroundColor: const Color(0xFF7FB77E),
                foregroundColor: Colors.white,
              ),
              child: NasteaText.body('Accept', fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

enum DispType { dashboard, list }
