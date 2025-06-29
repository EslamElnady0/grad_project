import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/cubits/bloc_observer.dart';
import 'package:grad_project/core/cubits/socket_cubit/global_socket_state.dart';
import 'package:grad_project/core/flavors/flavors_functions.dart';
import 'package:grad_project/core/helpers/constants.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import 'package:grad_project/core/services/firebase_messaging_service.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'core/cubits/socket_cubit/global_socket_cubit.dart';
import 'core/di/dependency_injection.dart';
import 'core/lifecycle/app_lifecycle_cubit.dart';
import 'core/routes/student_router.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options_student.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  bool isLogin = await SharedPrefHelper.getSecuredString(Constants.token) != '';
  await setupGetIt();

  Bloc.observer = GradBlocObserver();
  FlavorsFunctions.setupStudentsFlover();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  FirebaseMessagingService().initialize();
  runApp(GradProjectStudentApp(isLogin: isLogin));
}

class GradProjectStudentApp extends StatelessWidget {
  const GradProjectStudentApp({super.key, required this.isLogin});
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(320, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<AppLifecycleCubit>()),
          BlocProvider(create: (context) => getIt<SocketCubit>()),
        ],
        child: Builder(builder: (context) {
          return BlocListener<SocketCubit, SocketState>(
            listener: (context, state) {
              if (state is SocketNeedsRegisterUser) {
                context.read<SocketCubit>().registerUser(context: context);
              }
            },
            child: MaterialApp.router(
              title: 'Grad Project Students',
              themeMode: ThemeMode.light,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              locale: const Locale('ar'),
              routerConfig: StudentRouter.getRouter(isLogin),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            ),
          );
        }),
      ),
    );
  }
}
