import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/features/home/ui/cubit/bottom_nav_bar_cubit.dart';
import 'package:grad_project/features/home/ui/views/home_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeView.screenName:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => BottomNavBarCubit(),
                  child: const HomeView(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: Center(child: Text("UnKnown Route"))));
    }
  }
}
