import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';

class ThreeSecondComment extends StatelessWidget {
  const ThreeSecondComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(colors: [
          const Color(0xff344BFB).withOpacity(0.6),
          const Color(0xff374BE5),
        ]),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Row(
        spacing: 12.0,
        children: [
          CircleAvatar(
            child: ClipOval(
              child: Image.asset(AssetPaths.avatarImage),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mariah",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "Culture is more than style, it’s how we connect.",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff000000).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12.0)),
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Image.asset(
                  AssetPaths.starIcon,
                  height: 24.0,
                ),
              ),
              // Text(
              //   "3s",
              //   style: context.textTheme.bodySmall?.copyWith(
              //     color: AppColors.white,
              //     fontSize: 12.0,
              //     fontWeight: FontWeight.normal,
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
