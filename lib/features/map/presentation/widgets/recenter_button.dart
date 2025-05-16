import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../view models/map cubit/map_cubit.dart';

class RecenterButton extends StatelessWidget {
  const RecenterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.white,
      onPressed: () => context.read<MapCubit>().recenter(),
      child: const Icon(
        Icons.my_location,
        color: AppColors.darkblue,
      ),
    );
  }
}
