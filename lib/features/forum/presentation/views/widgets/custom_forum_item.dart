import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/features/forum/presentation/views/widgets/button_row.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/item_header.dart';

class CustomForumItem extends StatelessWidget {
  const CustomForumItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5.r,
                    spreadRadius: 3,
                    color: const Color(0xff112316).withOpacity(0.15)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ItemHeader(
                  from: "2 mins ago",
                  date: "12/10/2023",
                  name: "أ.د. أحمد المنوفي",
                  specialization: "أستاذ ودكتور مادة OOP",
                ),
                vGap(12),
                Text(
                  "📢 إعلان هام",
                  style: AppTextStyles.font10greenMedium
                      .copyWith(color: AppColors.black),
                ),
                vGap(20),
                Text(
                  "يرجى من جميع الطلاب حضور المحاضرة القادمة في موعدها، حيث سيتم مناقشة المواضيع الأساسية للامتحان النصفي القادم، وستشمل المحاضرة مراجعة شاملة للنماذج السابقة والأسئلة المتكررة.\n\n📌 ملاحظة: تم تحديث جميع المحاضرات السابقة والمحتوى التعليمي على النظام الإلكتروني الخاص بالجامعة، يُنصح الجميع بتحميل المحاضرات والتأكد من الاطلاع عليها قبل موعد المحاضرة.\n",
                  style: AppTextStyles.font10greenMedium
                      .copyWith(color: AppColors.black),
                ),
                Text(
                  "مع تمنياتي بالتوفيق للجميع، د. أحمد المنوفي ",
                  style: AppTextStyles.font10greenMedium
                      .copyWith(color: AppColors.black),
                ),
              ],
            ),
          ),
          vGap(8),
          const ButtonRow(),
          const Divider(
            endIndent: 80,
            indent: 80,
            color: AppColors.gray,
            thickness: 2,
            height: 16,
          )
        ],
      ),
    );
  }
}
