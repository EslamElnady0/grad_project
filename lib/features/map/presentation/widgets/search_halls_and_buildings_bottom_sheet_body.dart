import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_colors.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/core/widgets/custom_search_text_field.dart';
import 'package:grad_project/generated/l10n.dart';
import '../view models/get_buildings_cubit/get_buildings_cubit.dart';
import '../view models/get_halls_cubit/get_halls_cubit.dart';
import 'buildings_section.dart';
import 'draggable_top_widget.dart';
import 'halls_section.dart';

class SearchHallsAndBuildingsBottomSheetBody extends StatefulWidget {
  final ScrollController scrollController;
  const SearchHallsAndBuildingsBottomSheetBody({
    super.key,
    required this.scrollController,
  });

  @override
  State<SearchHallsAndBuildingsBottomSheetBody> createState() =>
      _SearchHallsAndBuildingsBottomSheetBodyState();
}

class _SearchHallsAndBuildingsBottomSheetBodyState
    extends State<SearchHallsAndBuildingsBottomSheetBody> {
  late TextEditingController searchController;
  late ValueNotifier<bool> showDropdownNotifier;
  late ValueNotifier<String> searchQueryNotifier;

  @override
  void initState() {
    searchController = TextEditingController();
    showDropdownNotifier = ValueNotifier<bool>(false);
    searchQueryNotifier = ValueNotifier<String>('');
    context.read<GetBuildingsCubit>().getBuildings().whenComplete(() {
      if (mounted) {
        context.read<GetHallsCubit>().getHalls();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    showDropdownNotifier.dispose();
    searchQueryNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DraggableTopWidget(),
            vGap(16),
            Text(
              S.of(context).writeYourPlace,
              style: AppTextStyles.font15BlackSemiBold,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            vGap(16),
            CustomSearchTextField(
              hintText: S.of(context).searchForBuilding,
              controller: searchController,
              onChanged: (value) {
                searchQueryNotifier.value = value.toLowerCase();
                showDropdownNotifier.value = value.isNotEmpty;
              },
              onTap: () {
                showDropdownNotifier.value = true;
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: showDropdownNotifier,
              builder: (context, showDropdown, _) {
                if (!showDropdown) return const SizedBox.shrink();
                return ValueListenableBuilder<String>(
                  valueListenable: searchQueryNotifier,
                  builder: (context, searchQuery, _) => Column(
                    children: [
                      vGap(12),
                      Container(
                        constraints: BoxConstraints(maxHeight: 300.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 1.0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BuildingsSection(
                                  searchQuery: searchQuery,
                                  searchController: searchController,
                                  showDropdownNotifier: showDropdownNotifier,
                                ),
                                Divider(height: 1.h, color: Colors.grey[300]),
                                HallsSection(
                                  searchQuery: searchQuery,
                                  searchController: searchController,
                                  showDropdownNotifier: showDropdownNotifier,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
