import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/presentation/screens/auth/reset_password/cubit/reset_password_action.dart';
import 'package:goallook/presentation/screens/auth/reset_password/cubit/reset_password_cubit.dart';
import 'package:goallook/presentation/screens/auth/reset_password/cubit/reset_password_state.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_header.dart';
import 'package:goallook/presentation/screens/auth/widgets/back_to_login_button.dart';
import 'package:goallook/presentation/theme/app_colors.dart';
import 'package:goallook/presentation/theme/app_dimens.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/presentation/theme/app_typography.dart';
import 'package:goallook/widgets/button/basic_button.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<ResetPasswordCubit>();
    final state = useBlocBuilder(cubit);

    useActionListener(cubit, (action) {
      switch (action) {
        case ResetPasswordSuccess():
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'The email has been sent successfully.',
                style: AppTypography.h4.copyWith(color: Colors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        case ResetPasswordShowLoading():
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        case ResetPasswordHideLoading():
          Navigator.of(context).pop();
        case ResetPasswordShowErrorMessage(:final message):
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

    return Scaffold(
      body: AnimatedSwitcher(
        duration: Durations.medium2,
        child: SingleChildScrollView(
          child: switch (state) {
            ResetPasswordInitial(:final errorMessage) => SafeArea(
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
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        error: errorMessage != null ? SizedBox.shrink() : null,
                      ),
                      controller: emailController,
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
                        cubit.resetPassword(emailController.text);
                      },
                      text: 'Send email',
                    ),
                    BackToLoginButton(),
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
