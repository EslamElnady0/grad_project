import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/subjects/ui/widgets/materials_view_body.dart';

import '../manager/materials_filter_cubit.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key});
  static const String routeName = '/materials';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaterialsFilterCubit(),
      child: const CustomScaffold(
        body: MaterialsViewBody(),
      ),
    );
  }
}
