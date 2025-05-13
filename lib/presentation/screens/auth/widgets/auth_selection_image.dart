import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class AuthSelectionImage extends HookWidget {
  const AuthSelectionImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/options.svg',
        width: 300,
        height: 300,
      ),
    );
  }
}
