import 'package:flutter/material.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/profile/data/models/get_profile_response_model.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/custom_edit_button.dart';
import 'package:grad_project/features/profile/presentation/views/widgets/info_widget.dart';
import 'package:grad_project/generated/l10n.dart';

class MainInfoColumn extends StatelessWidget {
  const MainInfoColumn({super.key, required this.profileModel});

  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InfoWidget(
            label: S.of(context).university_code, content: profileModel.code),
        vGap(10),
        InfoWidget(
          label: S.of(context).email,
          content: profileModel.email,
          textDirection: TextDirection.ltr,
        ),
        vGap(10),
        InfoWidget(
            label: S.of(context).department,
            content: profileModel.department.name),
        vGap(10),
        FlavorsFunctions.isStudent()
            ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: InfoWidget(
                              label: S.of(context).level,
                              content:
                                  (profileModel as StudentModel).level.name)),
                      hGap(20),
                      Expanded(
                          child: InfoWidget(
                              label: S.of(context).section, content: "6")),
                    ],
                  ),
                  vGap(10),
                  InfoWidget(
                      label: S.of(context).national_id,
                      content: (profileModel as StudentModel).nationalId),
                  vGap(10),
                  InfoWidget(
                      label: S.of(context).nationality,
                      content: (profileModel as StudentModel).nationality),
                  vGap(10),
                ],
              )
            : vGap(0),
         CustomEditButton(currentAvatarUrl: profileModel.avatarUrl,)
      ],
    );
  }
}


