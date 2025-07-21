import 'package:bkmc/config/routes/nav_router.dart';
import 'package:bkmc/constants/constants.dart';
import 'package:bkmc/modules/auth/pages/login_screen.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/ui/widgets/custom_appbar.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          title: 'Profile', backArrow: true, titleColor: AppColors.white),
      backgroundColor: AppColors.transparent,
      body: Container( width: double.infinity,
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h2,
             Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), // Match this
              border: Border.all(color: AppColors.primaryColor, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // With this
              child: Image.asset(
                AssetPaths.youngMan,
                fit: BoxFit.cover,
              ),
            ),
          ),
          h1,
           Text(
                    'Julia Andrew',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
          
              h4,
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                    'Name',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  h0P5,
               InputField(
                          controller: TextEditingController(text: 'Julia Andrew'),
                          label: "Search",
                          fillColor: AppColors.primaryColor,
                          borderColor: AppColors.primaryColor,
                          borderRadius: 16,
                          boxConstraints: 20,
                          labelColor: AppColors.white,
                          
                        ),
                        h2,
                         PrefixIconButton(
                onPressed: () {
                  NavRouter.pushAndRemoveUntil(context, LoginScreen());
                },
                title: 'Sign Out',
                prefixIconPath: AssetPaths.prince,
                iconColor:AppColors.primaryColor,
                titleColor: AppColors.primaryColor,
                backgroundColor: AppColors.white,
                height: 55,
                borderColor: Colors.transparent,
                mainAxisAlignment: MainAxisAlignment.center,
                hPadding: 18,
                borderRadius: 16,
              ),
               ],)
            ],
          ),
        ),
      ),
    );
  }
}
