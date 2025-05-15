import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:goallook/presentation/screens/auth/login/cubit/login_action.dart';
import 'package:goallook/presentation/screens/auth/login/cubit/login_cubit.dart';
import 'package:goallook/presentation/screens/auth/login/cubit/login_state.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_header.dart';
import 'package:goallook/presentation/screens/auth/widgets/create_account_button.dart';
import 'package:goallook/presentation/screens/auth/widgets/forgot_password_button.dart';
import 'package:goallook/presentation/screens/auth/widgets/other_options_to_login.dart';
import 'package:goallook/presentation/screens/auth/widgets/password_field.dart';
import 'package:goallook/presentation/screens/auth/widgets/google_button.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:goallook/widgets/button/basic_button.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<LoginCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      switch (action) {
        case LoginSuccess():
          context.go('/homePage');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Login successfully.',
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        case LoginShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        case LoginHideLoading():
          Navigator.of(context).pop();
        case LoginShowErrorMessage(:final message):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.error,
            ),
          );
      }
    });

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: Durations.medium2,
        child: SingleChildScrollView(
          child: switch (state) {
            LoginInitial(:final errorMessage) => SafeArea(
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
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        error: errorMessage != null ? SizedBox.shrink() : null,
                      ),
                      controller: emailController,
                    ),
                    AppSpacings.medium(),
                    PasswordField(
                      text: 'Password',
                      controller: passwordController,
                      hasError: errorMessage != null,
                    ),
                    AppSpacings.small(),
                    ForgotPasswordButton(),
                    const AppSpacings.medium(),
                    if (errorMessage != null)
                      Text(
                        errorMessage,
                        style: TextStyle(color: AppColors.error),
                      ),
                    const AppSpacings.medium(),
                    BasicButton(
                      onPressed: () {
                        cubit.getSignIn(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      text: 'Sign in',
                    ),
                    AppSpacings.medium(),
                    CreateAccountButton(),
                    AppSpacings.xLarge(),
                    OtherOptionsToLogin(),
                    AppSpacings.xLarge(),
                    GoogleButton(
                      text: 'Sign in with Google',
                      onPressed: cubit.loginWithGoogle,
                    ),
                    AppSpacings.small(),
                  ],
                ),
              ),
            ),
            _ => Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}
