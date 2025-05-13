import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_header.dart';
import 'package:goallook/presentation/screens/auth/widgets/back_to_login_button.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/widgets/button/basic_button.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
            child: Column(
              children: [
                AppSpacings.large(),
                AuthHeader(
                  headerText: 'Reset Password',
                  secondText: 'Enter your email below',
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Send email'),
                BackToLoginButton(),
                AppSpacings.small(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
