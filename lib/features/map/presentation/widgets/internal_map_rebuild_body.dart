import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/helpers/app_assets.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/core/theme/app_text_styles.dart';
import 'package:grad_project/generated/l10n.dart';

import '../../../../core/widgets/custom_search_text_field.dart';
import '../view models/map cubit/map_cubit.dart';
import 'most_searched_places_widget.dart';

class InternalMapRebuildBody extends StatefulWidget {
  const InternalMapRebuildBody({super.key});

  @override
  State<InternalMapRebuildBody> createState() => _InternalMapRebuildBodyState();
}

class _InternalMapRebuildBodyState extends State<InternalMapRebuildBody> {
  bool isTyping = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isTyping)
          Column(
            children: [
              Text(
                S.of(context).didntSreachYet,
                style: AppTextStyles.font15BlackSemiBold,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              vGap(22),
              Image.asset(
                Assets.imagesMapTrail,
                height: 156.h,
              ),
              vGap(22),
              Text(
                S.of(context).writeYourPlace,
                style: AppTextStyles.font15BlackSemiBold,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              vGap(16),
            ],
          ),
        CustomSearchTextField(
          hintText: S.of(context).searchForBuilding,
          onChanged: (p0) {
            if (p0.isNotEmpty) {
              setState(() {
                isTyping = true;
              });
            } else {
              setState(() {
                isTyping = false;
              });
            }
          },
          controller: context.read<MapCubit>().mapTextEditingController,
          focusNode: context.read<MapCubit>().mapTextFocusNode,
        ),
        vGap(16),
        MostSearchedPlacesWidget(),
      ],
    );
  }
}
