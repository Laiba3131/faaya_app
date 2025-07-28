import 'package:bkmc/constants/constants.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void showLottieDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                AssetPaths.congratulations,
                width: 150,
                height: 150,
                repeat: true,
              ),
              Text(
                "Successfully reported.",
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
