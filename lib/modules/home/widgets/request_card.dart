import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
    required this.userName,
    required this.time,
    required this.message,
    required this.onAccept,
    required this.onReject,
    this.avatar,
    this.showDivider = true,
    this.showButtons = true,
  });

  final String userName;
  final String time;
  final String message;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final ImageProvider<Object>? avatar;
  final bool showDivider;
  final bool showButtons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage:
                  avatar ?? const AssetImage(AssetPaths.avatarImage),
            ),
            w4,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        time,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  h0P7,
                  Text(
                    message,
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  h0P7,
                  showButtons
                      ? Row(
                          children: [
                            PrimaryButton(
                              onPressed: onReject,
                              title: 'Reject',
                              backgroundColor: AppColors.transparent,
                              borderRadius: 8,
                              width: 124,
                              height: 35,
                              hMargin: 0,
                              borderColor: AppColors.white,
                            ),
                            const SizedBox(width: 8),
                            PrimaryButton(
                              onPressed: onAccept,
                              title: 'Accept',
                              backgroundColor: AppColors.primaryColor,
                              borderRadius: 8,
                              width: 124,
                              height: 35,
                              hMargin: 0,
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
        if (showDivider) ...[
          const SizedBox(height: 16),
          Divider(color: AppColors.bgGrey, thickness: 1),
        ],
      ],
    );
  }
}
