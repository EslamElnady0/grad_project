import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/widgets/custom_text_form_field.dart';
import 'package:grad_project/features/dashboard/ui/cubit/students_search_cubit.dart';
import 'package:grad_project/generated/l10n.dart';

class CustomSearchContainer extends StatefulWidget {
  const CustomSearchContainer({super.key});

  @override
  State<CustomSearchContainer> createState() => _CustomSearchContainerState();
}

class _CustomSearchContainerState extends State<CustomSearchContainer> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    context.read<StudentsSearchCubit>().searchStudents(query);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0.64),
              blurRadius: 10,
              color: const Color(0xff112316).withOpacity(0.15),
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: _searchController,
              fillColor: AppColors.veryLightGray,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  Assets.imagesSvgsMagnifyingGlassIcon,
                  colorFilter:
                      const ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
                ),
              ),
              hintText: S.of(context).search_placeholder,
              textInputType: TextInputType.text,
            ),
          ),
        ],
      ),
    );
  }
}
