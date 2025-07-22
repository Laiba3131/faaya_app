import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionDropdownMenu extends StatelessWidget {
  final VoidCallback onReply;
  final VoidCallback onCopy;
  final VoidCallback onReport;
  final VoidCallback onDelete;

  const ActionDropdownMenu({
    super.key,
    required this.onReply,
    required this.onCopy,
    required this.onReport,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF1E0722),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.purpleAccent, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildItem(AssetPaths.reply, "Reply", onReply),
            _buildItem(AssetPaths.copy, "Copy", onCopy),
            _buildItem(AssetPaths.report, "Report", onReport),
            _buildItem(AssetPaths.delete, "Delete", onDelete),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(
              0.20,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Row(
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 8),
                Text(label,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
