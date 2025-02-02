
import 'package:go_router/go_router.dart';
import 'package:grad_project/features/home/views/home_view.dart';


abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kScannerView = '/ScannerView';
  static const kCartView = '/cartView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
      //  builder: (context, state) => SplashView(),
      ),

    ],
  );
}
