import 'package:get/get.dart';
import 'package:wedding_planning_app/data/models/dashboard_data.dart';
import 'package:wedding_planning_app/data/repositories/dashboard_repository.dart';

class DashboardController extends GetxController {
  DashboardController(this._repository);

  final DashboardRepository _repository;

  final isLoading = false.obs;
  final errorMessage = RxnString();
  final dashboard = Rxn<DashboardData>();
  final selectedTab = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadDashboard();
  }

  void selectTab(int index) {
    if (index == selectedTab.value) return;
    selectedTab.value = index;
  }

  Future<void> loadDashboard() async {
    final showSpinner = dashboard.value == null;
    if (showSpinner) isLoading.value = true;
    errorMessage.value = null;

    try {
      dashboard.value = await _repository.fetchDashboard();
    } catch (_) {
      if (dashboard.value == null) {
        errorMessage.value = 'Could not load your dashboard.';
      }
    } finally {
      if (showSpinner) isLoading.value = false;
    }
  }
}
