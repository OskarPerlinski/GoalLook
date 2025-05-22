import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:goallook/presentation/screens/bag/widgets/jersey_ordered_card.dart';
import 'package:goallook/widgets/appbar/basic_appbar.dart';

class BagPage extends HookWidget {
  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(showBackButton: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              JerseyOrderedCard(),
            ],
          ),
        ),
      ),
    );
  }
}
