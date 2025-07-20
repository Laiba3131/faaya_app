import 'package:bkmc/constants/constants.dart';
import 'package:bkmc/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: 'Profile', backArrow: true, titleColor: AppColors.white),
      backgroundColor: AppColors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120, // Make it square by setting equal width and height
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor, // Your border color
                width: 2.0,
              ),
              borderRadius:
                  BorderRadius.circular(8), // Optional: rounded corners
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  6), // Match or slightly smaller than container
              child: Image.asset(
                AssetPaths.avatarImage, // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
