import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class GradBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('onChange(${bloc.runtimeType}, $change)');
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('onCreate(${bloc.runtimeType})');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('onClose(${bloc.runtimeType})');
    super.onClose(bloc);
  }
}
