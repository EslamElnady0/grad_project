import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import 'package:grad_project/core/widgets/custom_scaffold.dart';
import 'package:grad_project/features/annoucements/logic/add_annoucements_cubit/add_annoucements_cubit.dart';
import 'package:grad_project/features/annoucements/ui/widgets/add_announcement_bloc_consumer.dart';
import '../widgets/add_annoucement_view_body.dart';

class AddAnnoucementView extends StatelessWidget {
  static const routeName = '/add-annoucement-view';
  const AddAnnoucementView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => getIt<AddAnnoucementsCubit>(),
        child:
            const AddAnnouncementBlocConsumer(child: AddAnnoucementViewBody()),
      ),
    );
  }
}
