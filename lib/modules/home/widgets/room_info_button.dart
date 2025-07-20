import 'package:flutter/material.dart';
import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';

class RoomInfoButton extends StatelessWidget {
  final String label;
  final bool isCount;

  const RoomInfoButton({
    super.key,
    required this.label,
    this.isCount = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xFF7b3d89),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor)),
      child: Text(
        label,
        style: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
