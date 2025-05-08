import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/widgets/custom_cached_network_image.dart';
import 'package:grad_project/core/widgets/full_screen_image_view.dart';
import 'package:grad_project/features/forum/data/models/get_all_questions_response_model.dart';

class ShowQusetionImage extends StatelessWidget {
  const ShowQusetionImage({
    super.key,
    required this.questionModel,
  });

  final QuestionModel? questionModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Stack(
        alignment: Alignment
            .topRight, 
        children: [
     
          CustomCachedNetworkImage(
            imageUrl: questionModel!.imageUrl!,
            width: double.infinity,
            borderRadius: 16.r,
          ),
    
     
          Positioned(
            top: 8.r,
            right: 8.r,
            child: GestureDetector(
              onTap: () {
              context.push(FullScreenImageView.routeName,
                  extra: questionModel!.imageUrl!);
              },
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons
                      .open_in_new, // يمكنك استبدالها بأي أيقونة أخرى
                  color: Colors.white,
                  size: 24.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
