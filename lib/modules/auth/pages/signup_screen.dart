import 'package:bkmc/constants/app_colors.dart';
import 'package:bkmc/constants/asset_paths.dart';
import 'package:bkmc/modules/auth/pages/login_screen.dart';
import 'package:bkmc/ui/input/input_field.dart';
import 'package:bkmc/ui/widgets/on_click.dart';
import 'package:bkmc/utils/extensions/extended_context.dart';
import 'package:bkmc/utils/heights_and_widths.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/routes/nav_router.dart';
import '../../../ui/button/primary_button.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isObseure = true;
  bool isObseureConfirmPasswors = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
    gradient: RadialGradient(
      center: Alignment(1.0, -0.74), // 100% X, 12.99% Y → approximate as (1.0, -0.74)
      radius: 2.0, // 188.4% width → radius > 1.0
      colors: [
        Color(0xFFC637E5), // Start color
        Color(0xFF161616), // End color
      ],
      stops: [0.0, 1.0],
    ),
  ),
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/png/Untitled-1 2.png'),
                  h2,
                  Text(
                    'Sign up with email.',
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
                        'User Name',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                      h0P5,
                      InputField(
                        controller: TextEditingController(),
                        label: 'Enter Name',
                        prefixIcon: SvgPicture.asset(AssetPaths.name),
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
                  h2,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm password',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                      h0P5,
                      InputField(
                        controller: TextEditingController(),
                        label: 'Confirm password',
                        obscureText: isObseureConfirmPasswors,
                        prefixIcon: SvgPicture.asset(AssetPaths.password),
                        lMargin: 15,
                        borderColor: AppColors.primaryColor,
                        fillColor: AppColors.inputFieldFillColor,
                        labelColor: AppColors.white,
                        borderRadius: 16,
                        suffixIcon: OnClick(
                            onTap: () {
                              setState(() {
                                isObseureConfirmPasswors =
                                    !isObseureConfirmPasswors;
                              });
                            },
                            child: SvgPicture.asset(!isObseureConfirmPasswors
                                ? AssetPaths.eye
                                : AssetPaths.eyeInVisible)),
                        suffixIconTopPadding: 19,
                      ),
                    ],
                  ),
                  h3,
                  PrimaryButton(
                    onPressed: () {
                      NavRouter.push(context, LoginScreen());
                    },
                    title: 'Register',
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
                          NavRouter.push(context, LoginScreen());
                        },
                        child: Text(
                          'Log in',
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
                        TextSpan(
                            text: "By Tapping Sign up you Agree to our "),
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
        ),
      ),
    );
  }
}
