import 'package:wedding_planning_app/data/models/budget_summary.dart';
import 'package:wedding_planning_app/data/models/wedding_reminder.dart';
import 'package:wedding_planning_app/data/models/wedding_summary.dart';

class DashboardData {
  const DashboardData({
    required this.wedding,
    required this.budget,
    this.nextReminder,
  });

  final WeddingSummary wedding;
  final BudgetSummary budget;
  final WeddingReminder? nextReminder;

  static const sample = DashboardData(
    wedding: WeddingSummary(
      coupleNames: 'Dilini & Roshan',
      dateLabel: 'Saturday, 18 October 2025',
      venue: 'Temple Trees',
      daysLeft: 38,
    ),
    budget: BudgetSummary(
      currency: 'LKR',
      total: 2580000,
      spent: 1940000,
    ),
    nextReminder: WeddingReminder(
      title: 'Second Facial Appointment',
      location: 'Luxe Beauty Salon, Colombo 03',
      dateLabel: '5 Sep 2025',
      timeLabel: '10:00 AM',
    ),
  );

  factory DashboardData.fromJson(Map<String, dynamic> json) {
    final reminder = json['nextReminder'];
    return DashboardData(
      wedding: WeddingSummary.fromJson(
        Map<String, dynamic>.from(json['wedding'] as Map),
      ),
      budget: BudgetSummary.fromJson(
        Map<String, dynamic>.from(json['budget'] as Map),
      ),
      nextReminder: reminder == null
          ? null
          : WeddingReminder.fromJson(Map<String, dynamic>.from(reminder as Map)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wedding': wedding.toJson(),
      'budget': budget.toJson(),
      'nextReminder': nextReminder?.toJson(),
    };
  }
}
