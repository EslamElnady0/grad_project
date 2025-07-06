import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/failure_state_widget.dart';
import 'package:grad_project/features/dashboard/data/models/students_response.dart';
import 'package:grad_project/features/dashboard/logic/dashboard_cubit/dashboard_cubit.dart';
import 'package:grad_project/features/dashboard/ui/cubit/students_search_cubit.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'custom_single_student_container.dart';
import 'custom_single_student_container_skeleton.dart';

class RegisteredStudentsListView extends StatelessWidget {
  const RegisteredStudentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) => state.maybeWhen(
        orElse: () => _buildLoadingState(),
        dashboardSuccess: (data) =>
            _buildSuccessState(context, data as StudentsResponse),
        dashboardFailure: (error) => _buildFailureState(context, error),
      ),
    );
  }
}

Widget _buildSuccessState(BuildContext context, StudentsResponse data) {
  return BlocBuilder<StudentsSearchCubit, String>(
    builder: (context, searchQuery) {
      final searchCubit = context.read<StudentsSearchCubit>();
      final filteredStudents =
          searchCubit.filterStudents(data.data, searchQuery);

      return RefreshIndicator(
        color: AppColors.primaryColordark,
        onRefresh: () async {
          context.read<DashboardCubit>().refresh();
        },
        child: filteredStudents.isEmpty && searchQuery.isNotEmpty
            ? _buildNoResultsState(context)
            : ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CustomSingleStudentContainer(
                    student: filteredStudents[index],
                  );
                },
                separatorBuilder: (context, index) => vGap(12),
                itemCount: filteredStudents.length,
              ),
      );
    },
  );
}

Widget _buildNoResultsState(BuildContext context) {
  return FailureStateWidget(
    errorMessage: S.of(context).tryAdjustingSearchTerms,
    title: S.of(context).noStudentsFound,
    icon: Icons.search_off,
    onRetry: () {
      context.read<StudentsSearchCubit>().clearSearch();
    },
  );
}

Widget _buildLoadingState({Color? highlightColor}) {
  return Skeletonizer(
    enabled: true,
    effect: highlightColor != null
        ? ShimmerEffect(highlightColor: highlightColor)
        : null,
    child: SingleChildScrollView(
      child: Column(
        spacing: 12.w,
        children: List.generate(10, (index) {
          return const CustomSingleStudentContainerSkeleton();
        }),
      ),
    ),
  );
}

Widget _buildFailureState(BuildContext context, String error) {
  return FailureStateWidget(
    errorMessage: error,
    title: S.of(context).failedToLoadStudents,
    icon: Icons.people_outline,
    onRetry: () {
      context.read<DashboardCubit>().refresh();
    },
  );
}
