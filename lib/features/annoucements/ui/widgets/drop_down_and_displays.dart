import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:grad_project/features/annoucements/ui/widgets/display_and_drop_down_button.dart';
import '../../../../generated/l10n.dart';

class DropDownAndDisplays extends StatefulWidget {
  const DropDownAndDisplays({super.key});

  @override
  State<DropDownAndDisplays> createState() => _DropDownAndDisplaysState();
}

class _DropDownAndDisplaysState extends State<DropDownAndDisplays> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DisplayAndDropDownButton(
            title: S.of(context).study_level,
            value: context.read<AddAnnoucementsCubit>().selectedLevel,
            contentList: context.read<AddAnnoucementsCubit>().levels,
            onSelected: (value) {
              setState(() {
                context.read<AddAnnoucementsCubit>().selectedLevel = value;
              });
            },
          ),
        ),
        hGap(16),
        Expanded(
          child: DisplayAndDropDownButton(
            title: S.of(context).subject,
            value: context.read<AddAnnoucementsCubit>().selectedCourse,
            onSelected: (value) {
              setState(() {
                context.read<AddAnnoucementsCubit>().selectedCourse = value;
              });
            },
            contentList: context.read<AddAnnoucementsCubit>().courses,
          ),
        ),
      ],
    );
  }
}
