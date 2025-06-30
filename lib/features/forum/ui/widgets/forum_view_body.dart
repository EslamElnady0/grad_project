import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_app_bar.dart';
import 'package:grad_project/core/widgets/custom_text_and_icon_button.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';
import 'package:grad_project/features/forum/logic/add_question/add_question_cubit.dart';
import 'package:grad_project/features/forum/logic/filter_questions_cubit/filter_questions_cubit.dart';
import 'package:grad_project/features/forum/logic/get_all_questions_cubit/get_all_questions_cubit.dart';
import 'package:grad_project/features/forum/ui/widgets/add_question_bottom_sheet.dart';
import 'package:grad_project/features/forum/ui/widgets/custom_forum_item.dart';
import 'package:grad_project/features/forum/ui/widgets/filter_questions_bottom_sheet.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home/ui/widgets/home_screens_header_row.dart';
import '../../../home/ui/widgets/title_text_widget.dart';

class ForumViewsBody extends StatelessWidget {
  const ForumViewsBody({super.key, this.questions, this.totalQuestions});
  final List<QuestionModel>? questions;
  final int? totalQuestions;

  void _showAddQuestionBottomSheet(BuildContext context) {
    showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return BlocProvider(
          create: (context) => getIt<AddQuestionCubit>(),
          child: AddQuestionBottomSheet(
            onQuestionAdded: () {
              // Refresh the questions list
              context.read<GetAllQuestionsCubit>().getAllQuestions();
            },
          ),
        );
      },
    );
  }

  void _showFilterQuestionsBottomSheet(BuildContext context) {
    showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return BlocProvider(
          create: (context) => getIt<FilterQuestionsCubit>(),
          child: FilterQuestionsBottomSheet(
            onFiltersApplied: ({
              int? department,
              int? semester,
              bool? likes,
              bool? myQuestions,
            }) {
              // Apply the filters and refresh the questions list
              final filterCubit = context.read<FilterQuestionsCubit>();
              filterCubit.getFilteredQuestions(
                department: department,
                semester: semester,
                likes: likes,
                myQuestions: myQuestions,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              children: [
                if(FlavorsFunctions.isStudent())  vGap(22),
                if(FlavorsFunctions.isStudent())
                HomeScreensHeaderRow(
                  onMenuTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  onSearchTap: () {},
                ),
                if(!FlavorsFunctions.isStudent())
                  CustomAppBar(title: S.of(context).forum),
                vGap(12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TitleTextWidget(
                    text: S.of(context).forum_welcome_message,
                  ),
                ),
                vGap(8),
                Row(children: [
                  if(FlavorsFunctions.isStudent())
                  CustomTextAndIconButton(
                    primaryButton: true,
                    text: S.of(context).add_your_question,
                    onTap: () => _showAddQuestionBottomSheet(context),
                    icon: const Icon(Icons.add, color: AppColors.white,),
                  ),
                  const Spacer(),
                  CustomTextAndIconButton(
                    primaryButton: false,
                    text: S.of(context).filter,
                    onTap: () => _showFilterQuestionsBottomSheet(context),
                    color: AppColors.darkblue,
                    icon: const Icon(Icons.tune,
                    color: AppColors.white,
                    ),
                  ),
                ]),
                vGap(8),
                Text("${S.of(context).questions_count} $totalQuestions",
                    style: AppTextStyles.font12GrayMedium),
                vGap(8),
              ],
            )),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) =>  CustomForumItem(
          questionModel: questions?[index],
          ),
          childCount: questions?.length ?? 0,
        ),
      ),
      SliverToBoxAdapter(
        child: vGap(150),
      ),
    ]); 
  }
}
