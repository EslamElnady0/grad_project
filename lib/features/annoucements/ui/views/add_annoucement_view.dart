import 'package:flutter/widgets.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import '../widgets/add_annoucement_view_body.dart';

class AddAnnoucementView extends StatelessWidget {
  static const routeName = '/add-annoucement-view';
  const AddAnnoucementView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: AddAnnoucementViewBody(),
    );
  }
}
