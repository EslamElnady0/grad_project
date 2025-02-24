import 'package:flutter/material.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/subjects/presentation/views/widgets/materials_view_body.dart';

class MaterialsView extends StatelessWidget {
  const MaterialsView({super.key});
static const routeName = '/materials';
  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      body:MaterialsViewBody(),
    );
  }
}