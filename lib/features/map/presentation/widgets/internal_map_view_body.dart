import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/widgets/custom_inner_screens_app_bar.dart';
import 'package:grad_project/generated/l10n.dart';
import 'package:latlong2/latlong.dart';
import '../view%20models/map%20cubit/map_cubit.dart';
import 'internal_map_rebuild_body.dart';

class InternalMapViewBody extends StatefulWidget {
  final LatLng? destinationCoordinates;
  final String? destinationName;
  
  const InternalMapViewBody({
    super.key,
    this.destinationCoordinates,
    this.destinationName,
  });

  @override
  State<InternalMapViewBody> createState() => _InternalMapViewBodyState();
}

class _InternalMapViewBodyState extends State<InternalMapViewBody> {
  @override
  void initState() {
    super.initState();
    // إذا تم تمرير destination، أضفه بعد تحميل الخريطة
    if (widget.destinationCoordinates != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<MapCubit>().addDestination(
          widget.destinationCoordinates!,
          widget.destinationName,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h, left: 16.w, right: 16.w),
          child: CustomInnerScreensAppBar(
            title: S.of(context).internalMap,
          ),
        ),
        const Expanded(child: InternalMapRebuildBody()),
      ],
    );
  }
}
