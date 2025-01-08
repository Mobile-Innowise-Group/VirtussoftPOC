import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserNameWidget extends StatelessWidget {
  final String username;
  final String userEmail;

  const UserNameWidget({
    required this.username,
    required this.userEmail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        SvgPicture.asset(
          'assets/icons/avatar.svg',
          width: 82,
          height: 82,
        ),
        const SizedBox(height: 16),
        Text(
          username,
          style: AppFonts.headingH3,
        ),
        const SizedBox(height: 4),
        Text(
          userEmail,
          style: AppFonts.bodyS.copyWith(
            color: AppColors.of(context).textSecondary,
          ),
        ),
      ],
    );
  }
}
