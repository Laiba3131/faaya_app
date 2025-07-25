import 'package:bkmc/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownAction {
  final String label;
  final VoidCallback onTap;

  DropdownAction({required this.label, required this.onTap});
}

class ActionDropdownWithoutIcon extends StatelessWidget {
  final List<DropdownAction> actions;

  const ActionDropdownWithoutIcon({
    super.key,
    required this.actions,
  }) : assert(actions.length >= 1 && actions.length <= 4,
            'Actions must be between 1 and 4');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryColor, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: actions
              .map((action) => _buildItem(action.label, action.onTap))
              .toList(),
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
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
