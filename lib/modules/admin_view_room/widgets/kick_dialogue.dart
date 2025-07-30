import 'package:oxyn_dev/config/config.dart';
import 'package:oxyn_dev/constants/constants.dart';
import 'package:oxyn_dev/ui/button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class KickDialogue extends StatelessWidget {
  const KickDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Container(
        // width: 70.w,
        child: Column(
          spacing: 12.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 12.0,
              children: [
                Column(
                  spacing: 4.0,
                  children: [
                    CircleAvatar(
                      radius: 24.0,
                      child: ClipOval(
                        child: Image.asset(
                          AssetPaths.avatarImage,
                        ),
                      ),
                    ),
                    Text(
                      "Audrey Blue",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  color: AppColors.black,
                  width: 1,
                ),
                Expanded(
                  child: Column(
                    spacing: 6.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AssetPaths.reportIcon,
                      ),
                      Text(
                        "Are you sure you want to remove Audrey Blue from the room?",
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              spacing: 8.0,
              children: [
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {
                      NavRouter.pop(context);
                    },
                    hMargin: 0,
                    backgroundColor: Colors.transparent,
                    titleColor: Color(0xffC637E5),
                    borderColor: Color(0xffC637E5),
                    fontWeight: FontWeight.bold,
                    borderRadius: 12.0,
                    title: "Cancel",
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {},
                    hMargin: 0,
                    borderRadius: 12.0,
                    backgroundColor: Color(0xffC637E5),
                    borderColor: Color(0xffC637E5),
                    title: "Kick",
                  ),
                ),
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 18.0, vertical: 10.0),
      ),
    );
  }
}
