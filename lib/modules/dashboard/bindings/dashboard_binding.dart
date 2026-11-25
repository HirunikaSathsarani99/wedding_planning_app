import 'package:get/get.dart';
import 'package:wedding_planning_app/data/repositories/dashboard_repository.dart';
import 'package:wedding_planning_app/data/repositories/sample_dashboard_repository.dart';
import 'package:wedding_planning_app/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardRepository>(
      () => const SampleDashboardRepository(),
      fenix: true,
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(Get.find<DashboardRepository>()),
      fenix: true,
    );
  }
}
