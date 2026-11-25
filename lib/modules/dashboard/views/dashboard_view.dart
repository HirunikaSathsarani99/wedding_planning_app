import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_app/core/theme/app_colors.dart';
import 'package:wedding_planning_app/core/theme/app_text_styles.dart';
import 'package:wedding_planning_app/data/models/dashboard_data.dart';
import 'package:wedding_planning_app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:wedding_planning_app/modules/dashboard/widgets/budget_summary_card.dart';
import 'package:wedding_planning_app/modules/dashboard/widgets/dashboard_bottom_nav.dart';
import 'package:wedding_planning_app/modules/dashboard/widgets/next_reminder_card.dart';
import 'package:wedding_planning_app/modules/dashboard/widgets/wedding_hero_card.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() {
        final tab = controller.selectedTab.value;
        return Column(
          children: [
            Expanded(
              child: SafeArea(
                bottom: false,
                child: _TabBody(tab: tab),
              ),
            ),
            DashboardBottomNav(
              currentIndex: tab,
              onTap: controller.selectTab,
            ),
          ],
        );
      }),
    );
  }
}

class _TabBody extends GetView<DashboardController> {
  const _TabBody({required this.tab});

  final int tab;

  @override
  Widget build(BuildContext context) {
    if (tab != 0) {
      final label = dashboardTabs[tab].label;
      return Center(
        child: Text(
          label,
          key: ValueKey('tab-$label'),
          style: AppTextStyles.display(size: 28),
        ),
      );
    }

    return Obx(() {
      final data = controller.dashboard.value;
      if (controller.isLoading.value && data == null) {
        return const Center(
          child: CircularProgressIndicator(color: AppColors.rose),
        );
      }

      if (data == null) {
        return _DashboardError(
          message:
              controller.errorMessage.value ?? 'Could not load your dashboard.',
          onRetry: controller.loadDashboard,
        );
      }

      return _DashboardHome(
        data: data,
        onRefresh: controller.loadDashboard,
      );
    });
  }
}

class _DashboardHome extends StatelessWidget {
  const _DashboardHome({
    required this.data,
    required this.onRefresh,
  });

  final DashboardData data;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final reminder = data.nextReminder;
    return RefreshIndicator(
      color: AppColors.rose,
      onRefresh: onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        children: [
          WeddingHeroCard(wedding: data.wedding),
          const SizedBox(height: 28),
          const _SectionTitle('Budget Summary'),
          const SizedBox(height: 12),
          BudgetSummaryCard(budget: data.budget),
          const SizedBox(height: 28),
          const _SectionTitle('Next Reminder'),
          const SizedBox(height: 12),
          if (reminder != null) NextReminderCard(reminder: reminder),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.display(size: 22, weight: FontWeight.w600),
    );
  }
}

class _DashboardError extends StatelessWidget {
  const _DashboardError({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.label(
                size: 15,
                weight: FontWeight.w500,
                color: AppColors.inkSoft,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onRetry,
              child: Text(
                'Try again',
                style: AppTextStyles.label(
                  size: 15,
                  color: AppColors.roseDeep,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
