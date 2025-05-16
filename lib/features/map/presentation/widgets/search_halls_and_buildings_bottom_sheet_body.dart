import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_search_text_field.dart';
import '../../../../generated/l10n.dart';

class SearchHallsAndBuildingsBottomSheetBody extends StatefulWidget {
  final ScrollController scrollController;
  const SearchHallsAndBuildingsBottomSheetBody(
      {super.key, required this.scrollController});

  @override
  State<SearchHallsAndBuildingsBottomSheetBody> createState() =>
      _SearchHallsAndBuildingsBottomSheetBodyState();
}

class _SearchHallsAndBuildingsBottomSheetBodyState
    extends State<SearchHallsAndBuildingsBottomSheetBody> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.only(bottom: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          vGap(22),
          Text(
            S.of(context).writeYourPlace,
            style: AppTextStyles.font15BlackSemiBold,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          vGap(16),
          CustomSearchTextField(
            hintText: S.of(context).searchForBuilding,
            onChanged: (p0) {},
            controller: searchController,
          ),
        ]),
      ),
    );
  }
}
