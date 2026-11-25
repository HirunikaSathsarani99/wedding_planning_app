import 'package:get/get.dart';
import 'package:wedding_planning_app/app/routes/app_routes.dart';
import 'package:wedding_planning_app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:wedding_planning_app/modules/dashboard/views/dashboard_view.dart';

abstract final class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
