import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final int peopleCount;
  final int micCount;
  final String timeAgo;
  final VoidCallback onTap;

  const RoomCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imagePath,
      required this.peopleCount,
      required this.micCount,
      required this.timeAgo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            maxLines: 1,
            style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              SvgPicture.asset(
                AssetPaths.name,
                height: 14,
                width: 14,
              ),
              w0P2,
              Text(
                '$peopleCount',
                style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              w1,
              SvgPicture.asset(
                AssetPaths.mic,
                height: 14,
                width: 14,
              ),
              w0P2,
              Text(
                '$micCount',
                style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              const SizedBox(width: 2),
              Text(
                timeAgo,
                style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
