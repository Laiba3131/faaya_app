import 'package:bkmc/config/config.dart';
import 'package:bkmc/constants/constants.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MicRequestDialog extends StatelessWidget {
  const MicRequestDialog({super.key});

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
              spacing: 14.0,
              children: [
                CircleAvatar(
                  radius: 24.0,
                  child: ClipOval(
                    child: Image.asset(
                      AssetPaths.avatarImage,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 4.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Audrey Blue",
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                      Row(
                        spacing: 6.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AssetPaths.handEmoji,
                          ),
                          Expanded(
                            child: Text(
                              "Do you want to speak",
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          )
                        ],
                      ),
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
                      NavRouter.pop(context, false);
                    },
                    hMargin: 0,
                    backgroundColor: Colors.transparent,
                    titleColor: Color(0xffC637E5),
                    borderColor: Color(0xffC637E5),
                    fontWeight: FontWeight.bold,
                    borderRadius: 12.0,
                    title: "No",
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {
                      NavRouter.pop(context, true);
                    },
                    hMargin: 0,
                    borderRadius: 12.0,
                    backgroundColor: Color(0xffC637E5),
                    borderColor: Color(0xffC637E5),
                    title: "Yes",
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
