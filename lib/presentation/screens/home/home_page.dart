import 'package:flutter/material.dart';
import 'package:goallook/domain/jersey/models/jersey_type.dart';
import 'package:goallook/presentation/screens/home/widgtes/jersey_list.dart';
import 'package:goallook/presentation/screens/home/widgtes/league_category.dart';
import 'package:goallook/presentation/theme/app_spacings.dart';
import 'package:goallook/widgets/appbar/basic_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              JerseyList(text: 'New Jersey', type: JerseyType.newJersey),
              AppSpacings.medium(),
              LeagueCategory(),
              AppSpacings.medium(),
              JerseyList(text: 'Popular Jersey', type: JerseyType.topSellings),
              AppSpacings.medium()
            ],
          ),
        ),
      ),
    );
  }
}
