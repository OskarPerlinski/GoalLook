import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_header.dart';
import 'package:goallook/presentation/screens/auth/widgets/login_button.dart';
import 'package:goallook/presentation/screens/auth/widgets/password_field.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/widgets/button/basic_button.dart';

class CreateAccountPage extends HookWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.xl),
            child: Column(
              children: [
                AppSpacings.large(),
                AuthHeader(
                  headerText: 'Create Account',
                  secondText:
                      'Create an account so you can explore all the football kits!',
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.medium(),
                PasswordField(text: 'Password'),
                AppSpacings.medium(),
                PasswordField(text: 'Confirm Password'),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Sign up'),
                AppSpacings.medium(),
                LoginButton(),
                AppSpacings.small(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
