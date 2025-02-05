import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/theme/app_theme.dart';
import 'package:pokemon/localization/localization_locales.dart';
import 'core/navigation/routes.dart';
import 'localization/supported_locales.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      getPages: Routes.appRoutes(),
      translations: LocalizationLocales(),
      locale: SupportedLocales().localeEN,
    );
  }
}
