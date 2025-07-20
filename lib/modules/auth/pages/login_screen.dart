import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/modules/auth/pages/signup_screen.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/routes/nav_router.dart';
import '../../../ui/button/primary_button.dart';
import '../../base_view/base_view.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObseure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFE94057),
              Color(0xFF6A0DAD),
            ],
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFC637E5),
                Color(0xFF161616),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/png/Untitled-1 2.png'),
              h2,
              Text(
                'Login with email.',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              h3,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  h0P5,
                  InputField(
                    controller: TextEditingController(),
                    label: 'Enter email',
                    prefixIcon: SvgPicture.asset(AssetPaths.email),
                    lMargin: 15,
                    borderColor: AppColors.primaryColor,
                    fillColor: AppColors.inputFieldFillColor,
                    labelColor: AppColors.white,
                    borderRadius: 16,
                  ),
                ],
              ),
              h2,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  h0P5,
                  InputField(
                    controller: TextEditingController(),
                    label: 'Enter password',
                    obscureText: isObseure,
                    prefixIcon: SvgPicture.asset(AssetPaths.password),
                    lMargin: 15,
                    borderColor: AppColors.primaryColor,
                    fillColor: AppColors.inputFieldFillColor,
                    labelColor: AppColors.white,
                    borderRadius: 16,
                    suffixIcon: OnClick(
                        onTap: () {
                          setState(() {
                            isObseure = !isObseure;
                          });
                        },
                        child: SvgPicture.asset(!isObseure
                            ? AssetPaths.eye
                            : AssetPaths.eyeInVisible)),
                    suffixIconTopPadding: 19,
                  ),
                ],
              ),
              h3,
              PrimaryButton(
                onPressed: () {
                  NavRouter.push(context, BaseView());
                },
                title: 'Sign In',
                backgroundColor: AppColors.primaryColor,
                height: 55,
                hMargin: 0,
                borderRadius: 16,
              ),
              h2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  OnClick(
                    onTap: () {
                      NavRouter.pushAndRemoveUntil(context, SignupScreen());
                    },
                    child: Text(
                      'Sign up',
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              h1,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    decoration: TextDecoration.none,
                  ),
                  children: const [
                    TextSpan(text: "By Tapping Sign up you Agree to our "),
                    TextSpan(
                      text: "Terms of Services",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.white,
                      ),
                    ),
                    TextSpan(text: " & "),
                    TextSpan(
                      text: "Privacy policy",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
