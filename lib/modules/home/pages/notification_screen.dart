import 'package:bkmc/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'data',
                style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                'data',
                style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      ),
    );
  }
}
