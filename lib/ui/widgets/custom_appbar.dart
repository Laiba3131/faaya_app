import 'package:oxyn_dev/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';

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
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xffC637E5),
        Color(0xff161616),
        Color(0xff161616)
      ], stops: [
        -40.0,
        77.0,
        100.0,
      ])),
      child: AppBar(
        backgroundColor: const Color(0xfff4f4f4).withOpacity(0.3),
        elevation: 0,
        title: Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
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
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
