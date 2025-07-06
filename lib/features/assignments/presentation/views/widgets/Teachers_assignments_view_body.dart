import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/core/widgets/custom_search_text_field.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_request_query_params_model.dart';
import 'package:grad_project/features/assignments/data/models/get_assignments_response_model.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_cubit/get_assignments_cubit.dart';
import 'package:grad_project/features/assignments/logic/cubits/get_assignments_cubit/get_assignments_state.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_assignment_widget.dart';
import 'package:grad_project/features/assignments/presentation/views/widgets/custom_assignment_widget_skeleton.dart';
import 'package:grad_project/features/home/ui/widgets/title_text_widget.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TeachersAssignmentsViewBody extends StatefulWidget {
  const TeachersAssignmentsViewBody(
      {super.key, required this.queryParamsModel});

  final GetAssignmentsRequestQueryParamsModel queryParamsModel;

  @override
  State<TeachersAssignmentsViewBody> createState() =>
      _TeachersAssignmentsViewBodyState();
}

class _TeachersAssignmentsViewBodyState
    extends State<TeachersAssignmentsViewBody> {
  final TextEditingController _searchController = TextEditingController();
  List<AssignmentModel> _filteredAssignments = [];
  List<AssignmentModel> _allAssignments = [];

  void _filterAssignments(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredAssignments = _allAssignments;
      });
    } else {
      setState(() {
        _filteredAssignments = _allAssignments.where((assignment) {
          return assignment.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(22),
        symmetricPaddingWidget(
            child: CustomInnerScreensAppBar(
                title: widget.queryParamsModel.assignmentStatus == "scheduled"
                    ? S.of(context).scheduled_assignments
                    : S.of(context).previous_assignments)),
        vGap(12),
        symmetricPaddingWidget(
            horizontalPadding: 36.w,
            child: TitleTextWidget(
                text: widget.queryParamsModel.assignmentStatus == "scheduled"
                    ? S.of(context).scheduled_assignments_description
                    : S.of(context).previous_assignments_description)),
        vGap(10),
        symmetricPaddingWidget(
          horizontalPadding: 16.w,
          child: CustomSearchTextField(
            controller: _searchController,
            onChanged: _filterAssignments,
            hintText: S.of(context).theSearch,
          ),
        ),
        vGap(12),
        Expanded(
          child: BlocBuilder<GetAssignmentsCubit, GetAssignmentsState>(
              builder: (context, state) {
            return state.maybeWhen(
              getAssignmentsSuccess: (data) {
                _allAssignments = data.data;
                if (_searchController.text.isEmpty) {
                  _filteredAssignments = _allAssignments;
                }
                return _buildSuccessState(_filteredAssignments);
              },
              orElse: () => _buildLoadingState(),
              getAssignmentsFailure: (error) =>
                  _buildFailureState(context, error, widget.queryParamsModel),
            );
          }),
        )
      ],
    );
  }
}

Widget _buildSuccessState(List<AssignmentModel> data) {
  return ListView.separated(
    padding: EdgeInsets.only(top: 10.h),
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomAssignmentWidget(
          assignmentModel: data[index],
        ),
      );
    },
    separatorBuilder: (context, index) => vGap(12),
    itemCount: data.length,
    physics: const BouncingScrollPhysics(),
  );
}

Widget _buildLoadingState() {
  return Skeletonizer(
    enabled: true,
    child: ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
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

Widget _buildFailureState(BuildContext context, String error,
    GetAssignmentsRequestQueryParamsModel queryParamsModel) {
  return FailureStateWidget(
    errorMessage: error,
    title: S.of(context).failedToLoadAssignments,
    icon: Icons.assignment_outlined,
    onRetry: () {
      context.read<GetAssignmentsCubit>().getAssignments(
          courseId: queryParamsModel.courseId,
          assignmentStatus: queryParamsModel.assignmentStatus,
          fromDate: queryParamsModel.fromDate);
    },
  );
}
