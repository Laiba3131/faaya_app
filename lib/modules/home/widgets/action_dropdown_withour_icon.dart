import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:flutter/material.dart';

class ActionDropdownWithourIcon extends StatelessWidget {
  final VoidCallback? invite;
  final VoidCallback? kick;
  final VoidCallback? ban;
  final VoidCallback? report;

  const ActionDropdownWithourIcon({
    super.key,
    required this.invite,
    required this.kick,
    required this.ban,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryColor, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildItem( "Invite", invite??(){}),
            _buildItem("Kick", kick??(){}),
            _buildItem("Ban", ban??(){}),
            _buildItem("Report", report??(){}),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
