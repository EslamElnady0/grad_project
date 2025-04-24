import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repos/annoucements_repo.dart';
part 'add_annoucements_state.dart';
part 'add_annoucements_cubit.freezed.dart';

class AddAnnoucementsCubit extends Cubit<AddAnnoucementsState> {
  final AnnoucementsRepo _repo;
  AddAnnoucementsCubit(this._repo)
      : super(const AddAnnoucementsState.initial());
}
