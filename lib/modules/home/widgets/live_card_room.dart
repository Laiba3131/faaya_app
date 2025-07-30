import 'dart:ui';

import 'package:oxyn_dev/constants/asset_paths.dart';
import 'package:oxyn_dev/ui/widgets/on_click.dart';
import 'package:oxyn_dev/utils/extensions/extended_context.dart';
import 'package:oxyn_dev/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../constants/app_colors.dart';

class LiveRoomCard extends StatelessWidget {
  final String title;
  final String description;
  final String host;
  final String timeAgo;
  final int peopleCount;
  final int micCount;
  final int chatCount;
  final VoidCallback? onTap;

  LiveRoomCard({
    super.key,
    required this.title,
    required this.description,
    required this.host,
    required this.timeAgo,
    required this.peopleCount,
    required this.micCount,
    required this.chatCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AssetPaths.music, // <-- replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
              child: Container(
                color: Colors.black.withOpacity(0.4), // dark overlay
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    SvgPicture.asset(AssetPaths.liveIcon),
                    Text(
                      "   Live",
                      style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                h1,
                Text(
                  description,
                  style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                h1,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          host,
                          style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        h0P6,
                        Text(
                          timeAgo,
                          style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AssetPaths.name,
                          height: 18,
                          width: 18,
                        ),
                        w0P5,
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
                          height: 18,
                          width: 18,
                        ),
                        w0P5,
                        Text(
                          '$micCount',
                          style: context.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                h2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OnClick(
                      onTap: onTap ?? () {},
                      child: Text(
                        "View Room",
                        style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
