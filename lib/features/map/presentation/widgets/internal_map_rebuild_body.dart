import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/spacing.dart';
import 'package:grad_project/features/map/presentation/widgets/map_search_body.dart';
import 'package:grad_project/generated/l10n.dart';
import '../../../../core/widgets/custom_search_text_field.dart';
import '../view models/map cubit/map_cubit.dart';
import 'didnt_search_yet_widget.dart';
import 'most_searched_places_widget.dart';

class InternalMapRebuildBody extends StatefulWidget {
  const InternalMapRebuildBody({super.key});

  @override
  State<InternalMapRebuildBody> createState() => _InternalMapRebuildBodyState();
}

class _InternalMapRebuildBodyState extends State<InternalMapRebuildBody> {
  bool isTyping = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isTyping) DidntSearchYetWidget(),
        CustomSearchTextField(
          hintText: S.of(context).searchForBuilding,
          onChanged: (p0) {
            setState(() {
              if (p0.isNotEmpty) {
                isTyping = true;
              } else {
                isTyping = false;
              }
            });
          },
          controller: context.read<MapCubit>().mapTextEditingController,
          focusNode: context.read<MapCubit>().mapTextFocusNode,
        ),
        vGap(16),
        BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            if (state is MapInitial) {
              return MostSearchedPlacesWidget();
            }
            return MapSearchBody();
          },
        ),
      ],
    );
  }
}
