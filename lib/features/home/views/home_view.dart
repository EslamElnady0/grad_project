import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  static const String screenName = "home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).hello),
      ),
    );
  }
}
