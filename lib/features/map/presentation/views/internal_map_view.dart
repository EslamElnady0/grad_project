import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/map/presentation/view%20models/map%20cubit/map_cubit.dart';

import '../widgets/internal_map_view_body.dart';

class InternalMapView extends StatelessWidget {
  static const String routeName = '/interbal-map-view';
  const InternalMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => MapCubit(),
        child: InternalMapViewBody(),
      ),
    );
  }
}
