import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sami_ahmed_tentwenty_assignment/routes/app_pages.dart';
import 'package:sami_ahmed_tentwenty_assignment/services/bloc/bloc_provider.dart';
import 'package:sami_ahmed_tentwenty_assignment/services/dependency_injection/service_locator.dart';

import 'core/theme/app_theme.dart';
import 'core/utils/localization/app_localizations.dart';
import 'core/utils/preferences/user_preferences.dart';
import 'features/language/bloc/language_bloc.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await UserPreferences.init();

  setupServiceLocator();

  runApp(
      MultiBlocProvider(
          providers: getBlocProviders(),
          child: const MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routes = AppPages.routers;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (BuildContext context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaler.clamp(
                minScaleFactor: 0.8, // Minimum scale factor allowed.
                maxScaleFactor: 1.0, // Maximum scale factor allowed.
              );
              return MediaQuery(
                data: mediaQueryData.copyWith(
                  textScaler: scale,
                  devicePixelRatio: 1.0,
                ),
                child: child!,
              );
            },
            theme: AppTheme.data(),
            locale: state.selectedLanguage.value,
            localizationsDelegates: const [
              AppLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('ar'), // Arabic
            ],
            routerConfig: _routes,
          );
        },
      ),
    );
  }
}
