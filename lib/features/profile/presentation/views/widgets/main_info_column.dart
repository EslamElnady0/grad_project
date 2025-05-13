import 'package:flutter/material.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/info_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class MainInfoColumn extends StatelessWidget {
  const MainInfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoWidget(
            label: S.of(context).university_code, content: "20812025000001"),
        vGap(10),
        InfoWidget(
            label: S.of(context).email, content: "20812025000001@zu.edu.eg"),
        vGap(10),
        InfoWidget(
            label: S.of(context).department, content: "الهندسة المعمارية"),
        vGap(10),
        FlavorsFunctions.isStudent()
            ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: InfoWidget(
                              label: S.of(context).level, content: "الثانية")),
                      hGap(20),
                      Expanded(
                          child: InfoWidget(
                              label: S.of(context).section, content: "6")),
                    ],
                  ),
                  vGap(10),
                  InfoWidget(
                      label: S.of(context).national_id,
                      content: "3020812131212"),
                  vGap(10),
                  InfoWidget(label: S.of(context).nationality, content: "مصري"),
                  vGap(10),
                ],
              )
            : vGap(10)
      ],
    );
  }
}
