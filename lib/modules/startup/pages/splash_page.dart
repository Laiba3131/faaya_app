import 'package:bkmc/config/config.dart';
import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/modules/auth/pages/login_screen.dart';
import 'package:bkmc/ui/button/primary_button.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/png/splash_image.png'),
            h2,
            Text(
              'Audio Live',
              style: context.textTheme.bodyMedium!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            h5,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SuffixIconButton(
                onPressed: () {
                  NavRouter.push(context, LoginScreen());
                },
                title: 'Continue',
                suffixIconWidget: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                ),
                backgroundColor: AppColors.primaryColor,
                height: 55,
                borderColor: Colors.transparent,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                hPadding: 18,
                borderRadius: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
