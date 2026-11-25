import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_app/app/routes/app_pages.dart';
import 'package:wedding_planning_app/app/routes/app_routes.dart';
import 'package:wedding_planning_app/core/theme/app_theme.dart';

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wedding Planning',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.dashboard,
      getPages: AppPages.pages,
    );
  }
}
