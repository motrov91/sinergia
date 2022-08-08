import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sinergia_app/provider/provider.dart';
import 'package:sinergia_app/router/app_routes.dart';
import 'package:sinergia_app/theme/app_theme.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<SlideshowProvider>(
          create: (_) => SlideshowProvider()),
      ChangeNotifierProvider<DatePickerProvider>(
          create: (_) => DatePickerProvider()),
      ChangeNotifierProvider<FormLoginProvider>(
          create: (_) => FormLoginProvider()),
      ChangeNotifierProvider<MenuHomeProvider>(
          create: (_) => MenuHomeProvider()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
        title: 'Sinergia App',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es', ''), // Spanish, no country code
        ],
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute
    );
  }
}
