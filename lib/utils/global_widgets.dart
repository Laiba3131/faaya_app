   import 'package:flutter/material.dart';
import 'package:bkmc/constants/asset_paths.dart';

import '../constants/app_colors.dart';
class GlobalWidgets {
  static Widget authBottomWidget(
      String firstTxt, String scndTxt, Function() onTap) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            firstTxt,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.black,
              fontFamily: AssetPaths.roboto,
            ),
          ),
          Text(
            scndTxt,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.primaryColor,
              fontFamily: AssetPaths.roboto,
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }}