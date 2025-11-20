import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    final bool isRequested = user.appAccess == 'requested' ? true : false;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: isRequested ? 8 : 12,
      ),
      decoration: BoxDecoration(
        color: isRequested ? Color(0xFFFFFEF5) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isRequested
              ? const Color(0xFFF5E9C8)
              : const Color(0xFFE8EDE7),
        ),
        boxShadow: !isRequested
            ? [
                BoxShadow(
                  color: const Color(0xFFE8EDE7),
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: (isRequested && type == DispType.list)
            ? const EdgeInsets.only(top: 4)
            : EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: (isRequested && type == DispType.list)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            _profilePic(),
            Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NasteaText.body(
                    user.name,
                    fontSize: type == DispType.dashboard ? 14 : 16,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  NasteaText.body(
                    user.phoneNumber,
                    color: Color(0xFF6B7A6A),
                    fontSize: type == DispType.dashboard ? 12 : 14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (isRequested && type == DispType.list)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: const Color(0xFFE8B84E),
                          ),
                          Gap(6),
                          NasteaText.body(
                            "Requested access",
                            color: const Color(0xFF8B7355),
                            fontSize: 12,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  if (isRequested && type == DispType.list)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Wrap(
                        spacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                              maximumSize: Size(82, 36),
                              minimumSize: Size(82, 36),
                              alignment: Alignment.center,
                              // padding: const EdgeInsets.symmetric(horizontal: 16),
                              padding: EdgeInsets.zero,
                              side: const BorderSide(color: Color(0xFFD77676)),
                              foregroundColor: Color(0xFFD77676),
                              backgroundColor: Colors.white,
                            ),
                            child: NasteaText.body(
                              'Decline',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                              maximumSize: Size(82, 36),
                              minimumSize: Size(82, 36),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              backgroundColor: const Color(0xFF7FB77E),
                              foregroundColor: Colors.white,
                            ),
                            child: NasteaText.body(
                              'Accept',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (isRequested)
              if (type == DispType.dashboard)
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        maximumSize: Size(32, 32),
                        minimumSize: Size(32, 32),
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        shape: CircleBorder(),
                        side: const BorderSide(color: Color(0xFFD77676)),
                        foregroundColor: Color(0xFFD77676),
                        backgroundColor: Colors.white,
                      ),
                      child: Icon(Icons.close, size: 16),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        maximumSize: Size(82, 32),
                        minimumSize: Size(82, 32),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        backgroundColor: const Color(0xFF7FB77E),
                        foregroundColor: Colors.white,
                      ),
                      child: NasteaText.body(
                        'Accept',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
            if (!isRequested)
              Icon(Icons.more_vert_rounded, color: Color(0xFF6B7A6A)),
          ],
        ),
      ),
    );
  }

  Container _profilePic() {
    return Container(
      width: type == DispType.dashboard ? 40 : 45,
      height: type == DispType.dashboard ? 40 : 45,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _getGradientClr(),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: NasteaText.body(
          user.name[0],
          color: user.appAccess == 'requested'
              ? const Color(0xFF8B7355)
              : Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  List<Color> _getGradientClr() {
    return switch (user.appAccess) {
      'requested' => const [Color(0xFFF9E8B8), Color(0xFFF5DDA0)],
      'approved' => const [Color(0xFFA8D5A8), Color(0xFF7FB77E)],
      _ => const [Color(0xFFD5D5D5), Color(0xFFB5B5B5)],
    };
  }
}

enum DispType { dashboard, list }
