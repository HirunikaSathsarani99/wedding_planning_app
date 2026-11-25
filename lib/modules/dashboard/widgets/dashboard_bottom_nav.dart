import 'package:flutter/material.dart';
import 'package:wedding_planning_app/core/theme/app_colors.dart';
import 'package:wedding_planning_app/core/theme/app_text_styles.dart';

class DashboardTab {
  const DashboardTab({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;
}

const dashboardTabs = [
  DashboardTab(
    label: 'Home',
    icon: Icons.home_rounded,
    color: AppColors.navHome,
  ),
  DashboardTab(
    label: 'Budget',
    icon: Icons.account_balance_wallet_outlined,
    color: AppColors.navBudget,
  ),
  DashboardTab(
    label: 'Guests',
    icon: Icons.favorite_border,
    color: AppColors.navGuests,
  ),
  DashboardTab(
    label: 'Reminders',
    icon: Icons.notifications_none_rounded,
    color: AppColors.navReminders,
  ),
  DashboardTab(
    label: 'AI',
    icon: Icons.auto_awesome,
    color: AppColors.navAi,
  ),
];

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.navBackground,
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8, bottom: bottom + 6),
        child: Row(
          children: [
            for (var i = 0; i < dashboardTabs.length; i++)
              Expanded(
                child: _NavButton(
                  tab: dashboardTabs[i],
                  selected: i == currentIndex,
                  onTap: () => onTap(i),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.tab,
    required this.selected,
    required this.onTap,
  });

  final DashboardTab tab;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(tab.icon, color: tab.color, size: 24),
            const SizedBox(height: 4),
            Text(
              tab.label,
              style: AppTextStyles.label(
                size: 11,
                weight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected ? tab.color : AppColors.navLabel,
                letterSpacing: 0,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              height: 2,
              width: selected ? 18 : 0,
              decoration: BoxDecoration(
                color: tab.color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
