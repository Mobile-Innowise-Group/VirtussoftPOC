import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SettingRowWidget extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const SettingRowWidget({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = AppColors.of(context);

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.primaryBg,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(AppDimens.OPACITY_0_6),
              blurRadius: AppDimens.RADIUS_10,
              offset: AppDimens.DEFAULT_SHADOW_OFFSET,
            ),
          ],
          borderRadius: BorderRadius.circular(AppDimens.RADIUS_10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.PADDING_18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(text),
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.primary.withOpacity(AppDimens.OPACITY_0_6),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.PADDING_4),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: AppDimens.SIZE_12,
                    color: colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
