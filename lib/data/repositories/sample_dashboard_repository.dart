import 'package:wedding_planning_app/data/models/dashboard_data.dart';
import 'package:wedding_planning_app/data/repositories/dashboard_repository.dart';

class SampleDashboardRepository implements DashboardRepository {
  const SampleDashboardRepository();

  @override
  Future<DashboardData> fetchDashboard() async {
    return DashboardData.sample;
  }
}
