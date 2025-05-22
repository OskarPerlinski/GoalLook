import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/widgets/button/basic_button.dart';

class CheckOutButton extends HookWidget {
  const CheckOutButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        alignment: Alignment.center,
        child: BasicButton(onPressed: () {}, text: 'BUY NOW'),
      ),
    );
  }
}
