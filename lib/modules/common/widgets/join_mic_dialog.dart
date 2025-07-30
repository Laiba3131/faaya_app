import 'package:oxyn_dev/config/config.dart';
import 'package:oxyn_dev/constants/app_colors.dart';
import 'package:oxyn_dev/constants/asset_paths.dart';
import 'package:oxyn_dev/ui/button/primary_button.dart';
import 'package:oxyn_dev/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/heights_and_widths.dart';

class JoinMicDialog extends StatelessWidget {
  const JoinMicDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 345,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      AssetPaths.youngMan,
                    ),
                  ),
                ),
                w1,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AssetPaths.prince,
                              height: 20,
                              width: 20,
                            ),
                            w1,
                            Text(
                              'Admin',
                              style: context.textTheme.bodyMedium!.copyWith(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Julia Andrew',
                        style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Admin is Inviting you to join the mic option.',
              style: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            h1,
          ],
        ),
      ),
    );
  }
}
