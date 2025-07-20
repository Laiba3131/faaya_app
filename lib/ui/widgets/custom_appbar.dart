import 'package:bkmc/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';

import '../../config/routes/nav_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool backArrow;
  final Color? titleColor;

  const CustomAppbar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.bottom,
    this.actions,
    this.backArrow = true,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:AppColors.cardColor,
      elevation: 0,
      title: Text(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,fontSize: 18,
          color: titleColor ?? context.colorScheme.onPrimary,
        ),
      ),
      automaticallyImplyLeading: false,
      leading: showBackButton && backArrow && Navigator.of(context).canPop()
          ? IconButton(
              onPressed: () => NavRouter.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              padding: EdgeInsets.zero,
            )
          : null,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
