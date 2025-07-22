import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/heights_and_widths.dart';

class MicPermissionDialog extends StatelessWidget {
  const MicPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 53,
                  height: 53,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      AssetPaths.youngMan,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                w1,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Julia Andrew',
                        style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFF05ED0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AssetPaths.prince),
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
                      const SizedBox(height: 6),
                      Text(
                        'Admin is Inviting you to join the mic option.',
                        style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
