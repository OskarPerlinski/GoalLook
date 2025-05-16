import 'package:flutter/material.dart';
import 'package:goallook/presentation/screens/home/widgtes/league_category.dart';
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
              LeagueCategory()
            ],
          ),
        ),
      ),
    );
  }
}