import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_selection_buttons.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_selection_image.dart';
import 'package:goallook/presentation/screens/auth/widgets/auth_selections_header.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';

class AuthSelectionPage extends HookWidget {
  const AuthSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthSelectionImage(),
            AppSpacings.xLarge(),
            AuthSelectionsHeader(),
            AppSpacings.xLarge(),
            AuthSelectionButtons(),
            AppSpacings.small(),
          ],
        ),
      ),
    );
  }
}
