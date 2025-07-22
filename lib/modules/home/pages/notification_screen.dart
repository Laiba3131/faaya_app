import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/modules/home/widgets/request_card.dart';
import 'package:bkmc/ui/widgets/custom_appbar.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Notifications',
        backArrow: true,
        titleColor: AppColors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-1.1, 0),
            radius: 1.5,
            colors: [
              Color(0xFFC637E5),
              Color(0xFF161616),
              Color(0xFF161616),
            ],
            stops: [0.0, 0.75, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Mark all as read',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              h2,
              RequestCard(
                avatar: const AssetImage(AssetPaths.youngMan),
                userName: 'John Doe',
                time: '20 min',
                message: 'John Doe wants to join your stream',
                onAccept: () {},
                onReject: () {},
              ),
              h2,
              RequestCard(
                showButtons: false,
                userName: 'John Doe',
                time: '20 min',
                message: 'John Doe wants to join your stream',
                onAccept: () {},
                onReject: () {},
              ),
              h2,
              RequestCard(
                avatar: const AssetImage(AssetPaths.listen),
                showButtons: false,
                userName: 'John Doe',
                time: '20 min',
                message: 'John Doe wants to join your stream',
                onAccept: () {},
                onReject: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
