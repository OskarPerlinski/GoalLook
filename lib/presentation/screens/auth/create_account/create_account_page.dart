import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/presentation/screens/auth/create_account/cubit/create_account_action.dart';
import 'package:goallook/presentation/screens/auth/create_account/cubit/create_account_cubit.dart';
import 'package:goallook/presentation/screens/auth/create_account/cubit/create_account_state.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_header.dart';
import 'package:goallook/presentation/screens/auth/widgets/login_button.dart';
import 'package:goallook/presentation/screens/auth/widgets/password_field.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:goallook/widgets/button/basic_button.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class CreateAccountPage extends HookWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<CreateAccountCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      switch (action) {
        case CreateAccountSuccess():
          //context.go(AppRoutes.homePage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Registered successfully.',
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        case CreateAccountShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        case CreateAccountHideLoading():
          Navigator.of(context).pop();
        case CreateAccountShowErrorMessage(:final message):
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
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedSwitcher(
        duration: Durations.medium2,
        child: SingleChildScrollView(
          child: switch (state) {
            CreateAccountInitial(:final errorMessage) => SafeArea(
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
                    AppSpacings.medium(),
                    PasswordField(
                      text: 'Confirm Password',
                      controller: confirmPasswordController,
                      hasError: errorMessage != null,
                    ),
                    const AppSpacings.medium(),
                    if (errorMessage != null)
                      Text(
                        errorMessage,
                        style: TextStyle(color: AppColors.error),
                      ),
                    const AppSpacings.medium(),
                    BasicButton(
                      onPressed: () {
                        cubit.getSignUpWithEmail(
                          emailController.text,
                          passwordController.text,
                          confirmPasswordController.text
                        );
                      },
                      text: 'Sign up',
                    ),
                    AppSpacings.medium(),
                    LoginButton(),
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
