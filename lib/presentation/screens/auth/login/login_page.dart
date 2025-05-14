import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_header.dart';
import 'package:goallook/presentation/screens/auth/widgets/create_account_button.dart';
import 'package:goallook/presentation/screens/auth/widgets/forgot_password_button.dart';
import 'package:goallook/presentation/screens/auth/widgets/password_field.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/widgets/button/basic_button.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.xl),
            child: Column(
              children: [
                AppSpacings.large(),
                AuthHeader(
                  headerText: 'Login here',
                  secondText: "Welcome back! You've been missed!",
                ),
                AppSpacings.xLarge(),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                AppSpacings.medium(),
                PasswordField(text: 'Password', controller: passwordController,),
                AppSpacings.small(),
                ForgotPasswordButton(),
                AppSpacings.xLarge(),
                BasicButton(onPressed: () {}, text: 'Sign in'),
                AppSpacings.medium(),
                CreateAccountButton(),
                AppSpacings.small(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
