import 'package:flutter/material.dart';
import 'annoucement_item.dart';

class AnnoucementsListView extends StatelessWidget {
  const AnnoucementsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // ignore: prefer_const_constructors
          return AnnoucementItem();
        },
        itemCount: 10);
  }
}
