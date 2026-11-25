import 'package:wedding_planning_app/data/models/dashboard_data.dart';

/// Loads the home dashboard.
///
/// [SampleDashboardRepository] returns local sample data. When the API is
/// ready, add another implementation that maps the response with
/// [DashboardData.fromJson] and register that class from the dashboard binding.
abstract class DashboardRepository {
  Future<DashboardData> fetchDashboard();
}
