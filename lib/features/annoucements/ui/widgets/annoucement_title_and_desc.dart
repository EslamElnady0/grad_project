import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import '../../../../generated/l10n.dart';
import 'custom_title_and_text_field.dart';

class AnnoucementTitleAndDesc extends StatelessWidget {
  const AnnoucementTitleAndDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddAnnoucementsCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleAndTextField(
            controller: context.read<AddAnnoucementsCubit>().titleController,
            title: S.of(context).news_title,
            hintText: S.of(context).news_title_description,
          ),
          vGap(12),
          CustomTitleAndTextField(
            controller: context.read<AddAnnoucementsCubit>().descController,
            title: S.of(context).news_content,
            hintText: S.of(context).news_content_description,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
