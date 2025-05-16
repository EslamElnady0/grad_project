import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/features/map/data/model/get_buildings_response.dart';
import 'package:grad_project/features/map/data/model/get_halls_response.dart';
import 'package:grad_project/generated/l10n.dart';

class SearchResultList<T> extends StatelessWidget {
  final List<T> items;
  final String searchQuery;
  final String noItemsText;
  final void Function(T) onItemSelected;

  const SearchResultList({
    super.key,
    required this.items,
    required this.searchQuery,
    required this.noItemsText,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final filteredItems = items.where((item) {
      if (item is HallData) {
        return item.name.toLowerCase().contains(searchQuery) ||
            item.code.toLowerCase().contains(searchQuery);
      } else if (item is BuildingModel) {
        return item.name.toLowerCase().contains(searchQuery) ||
            item.code.toLowerCase().contains(searchQuery);
      }
      return false;
    }).toList();

    if (filteredItems.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: Text(
          noItemsText,
          style: AppTextStyles.font14DarkBlueMedium,
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        String name = '';
        String code = '';

        if (item is HallData) {
          name = item.name;
          code = item.code;
        } else if (item is BuildingModel) {
          name = item.name;
          code = item.code;
        }

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 6.h,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: Constants.whiteGrad,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  title: Text(
                    name,
                    style: AppTextStyles.font14DarkBlueMedium,
                  ),
                  subtitle: Text(
                    '${S.of(context).code}: $code',
                    style: AppTextStyles.font12DarkBlueMedium,
                  ),
                  onTap: () => onItemSelected(item),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
