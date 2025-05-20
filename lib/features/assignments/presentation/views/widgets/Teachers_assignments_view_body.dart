import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_drop_down_button.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_text_form_field.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_request_query_params_model.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_cubit/get_assignments_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_cubit/get_assignments_state.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_assignment_widget.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_asssignment_widget_skeleton.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TeachersAssignmentsViewBody extends StatelessWidget {
  const TeachersAssignmentsViewBody(
      {super.key, required this.queryParamsModel});

  final GetAssignmentsRequestQueryParamsModel queryParamsModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(22),
        symmetricPaddingWidget(
            child: CustomInnerScreensAppBar(
                title: queryParamsModel.assignmentStatus == "scheduled"
                    ? S.of(context).scheduled_assignments
                    : S.of(context).previous_assignments)),
        vGap(12),
        symmetricPaddingWidget(
            horizontalPadding: 36.w,
            child: TitleTextWidget(
                text: queryParamsModel.assignmentStatus == "scheduled"
                    ? S.of(context).scheduled_assignments_description
                    : S.of(context).previous_assignments_description)),
        vGap(10),
        symmetricPaddingWidget(
            child: Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                fillColor: AppColors.veryLightGray,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    Assets.imagesSvgsMagnifyingGlassIcon,
                    colorFilter:
                        const ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
                  ),
                ),
                hintText: S.of(context).theSearch,
                textInputType: TextInputType.text,
              ),
            ),
            hGap(8),
            CustomDropDownButton(
              initialValue: S.of(context).next_seven_days,
              values: [S.of(context).next_seven_days],
              onChanged: (value) {},
            ),
          ],
        )),
        vGap(12),
        Expanded(
          child: BlocBuilder<GetAssignmentsCubit, GetAssignmentsState>(
              builder: (context, state) => state.maybeWhen(
                    getAssignmentsSuccess: (data) => _buildSuccessState(data),
                    orElse: () => _buildLoadingState(),
                  )),
        )
      ],
    );
  }
}

Widget _buildSuccessState(GetAssignmentsResponseModel data) {

  return ListView.separated(
    padding: EdgeInsets.only(top: 10.h),
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomAssignmentWidget(
          assignmentModel: data.data[index],
        ),
      );
    },
    separatorBuilder: (context, index) => vGap(12),
    itemCount: data.data.length,
    physics: const BouncingScrollPhysics(),
  );
}

Widget _buildLoadingState() {
  return Skeletonizer(
    enabled: true,
    child: ListView.separated(
      padding: EdgeInsets.only(top: 10.h),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const CustomAssignmentWidgetSkeleton(),
        );
      },
      separatorBuilder: (context, index) => vGap(12),
      itemCount: 5,
    ),
  );
}
