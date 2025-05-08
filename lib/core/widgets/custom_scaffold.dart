import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Widget? bottomSheet;
  final Widget? drawer;
  final bool extendBody;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final Key? scaffoldKey;
  const CustomScaffold(
      {super.key,
      this.appBar,
      this.body,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.drawer,
      this.extendBody = false,
      this.floatingActionButton,
      this.floatingActionButtonAnimator,
      this.floatingActionButtonLocation,
      this.resizeToAvoidBottomInset,
      this.backgroundColor,
      this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor ,
      appBar: appBar,
      key: scaffoldKey,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      extendBody: extendBody,
      floatingActionButton: floatingActionButton,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    ));
  }
}
