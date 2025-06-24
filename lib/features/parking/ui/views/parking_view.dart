import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_scaffold.dart';
import '../../logic/parking_cubit/parking_cubit.dart';
import '../widgets/parking_view_body.dart';

class ParkingView extends StatelessWidget {
  static const String routeName = '/parking';
  const ParkingView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => getIt<ParkingCubit>()..fetchParkingSlots(),
        child: const ParkingViewBody(),
      ),
    );
  }
}
