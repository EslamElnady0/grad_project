import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/map/presentation/view%20models/map%20cubit/map_cubit.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/internal_map_view_body.dart';

class InternalMapView extends StatelessWidget {
  static const String routeName = '/interbal-map-view';
  
  const InternalMapView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final LatLng? destinationCoordinates = extra?['destinationCoordinates'] as LatLng?;
    final String? destinationName = extra?['destinationName'] as String?;
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => getIt<MapCubit>()..init(),
        child: InternalMapViewBody(
          destinationCoordinates: destinationCoordinates,
          destinationName: destinationName,
        ),
      ),
    );
  }
}
