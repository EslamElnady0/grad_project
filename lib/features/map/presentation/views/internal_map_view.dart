import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';

import '../widgets/internal_map_view_body.dart';

class InternalMapView extends StatelessWidget {
  static const String routeName = '/interbal-map-view';
  const InternalMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: InternalMapViewBody(),
    );
  }
}
