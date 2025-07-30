import 'package:oxyn_dev/config/routes/nav_router.dart';
import 'package:oxyn_dev/constants/app_colors.dart';
import 'package:oxyn_dev/constants/asset_paths.dart';
import 'package:oxyn_dev/modules/home/pages/notification_screen.dart';
import 'package:oxyn_dev/ui/input/input_field.dart';
import 'package:oxyn_dev/ui/widgets/on_click.dart';
import 'package:oxyn_dev/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomAppbarForHome extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool backArrow;
  final Color? titleColor;

  final TextEditingController searchController;
  final void Function(String)? onSearchChange;

  const CustomAppbarForHome({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.bottom,
    this.actions,
    this.backArrow = true,
    this.titleColor,
    required this.searchController,
    this.onSearchChange,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0) + 20),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffC637E5),
              Color(0xff161616),
              Color(0xff161616),
            ],
            stops: [-40.0, 77.0, 100.0],
          ),
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            children: [
              Expanded(
                child: InputField(
                  controller: searchController,
                  label: 'Search rooms',
                  borderRadius: 20,
                  suffixIcon: SvgPicture.asset(AssetPaths.search),
                  fillColor: const Color(0xFF936f9b),
                  labelColor: AppColors.white,
                  boxConstraints: 20,
                  onChange: onSearchChange,
                ),
              ),
              const SizedBox(width: 12),
              OnClick(
                onTap: () {
                  NavRouter.push(context, NotificationScreen());
                },
                child: SvgPicture.asset(AssetPaths.notification),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
