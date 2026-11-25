import 'package:flutter/material.dart';
import 'package:wedding_planning_app/core/theme/app_colors.dart';
import 'package:wedding_planning_app/core/theme/app_text_styles.dart';
import 'package:wedding_planning_app/core/utils/currency_formatter.dart';
import 'package:wedding_planning_app/data/models/budget_summary.dart';

class BudgetSummaryCard extends StatelessWidget {
  const BudgetSummaryCard({super.key, required this.budget});

  final BudgetSummary budget;

  @override
  Widget build(BuildContext context) {
    final total = formatCurrency(budget.total, currency: budget.currency);
    final spent = formatCurrency(budget.spent, currency: budget.currency);
    final remaining = formatCurrency(
      budget.remaining,
      currency: budget.currency,
    );

    return _WhiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL BUDGET',
            style: AppTextStyles.label(
              color: AppColors.muted,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            total,
            style: AppTextStyles.label(
              size: 28,
              weight: FontWeight.w800,
              color: AppColors.ink,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 14),
          _BudgetProgressBar(value: budget.spentFraction),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  '$spent spent',
                  style: AppTextStyles.label(
                    size: 12,
                    weight: FontWeight.w500,
                    color: AppColors.inkSoft,
                    letterSpacing: 0,
                  ),
                ),
              ),
              Text(
                '$remaining remaining',
                style: AppTextStyles.label(
                  size: 12,
                  weight: FontWeight.w600,
                  color: AppColors.remaining,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BudgetProgressBar extends StatelessWidget {
  const _BudgetProgressBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * value;
        return Container(
          height: 7,
          decoration: BoxDecoration(
            color: AppColors.barTrack,
            borderRadius: BorderRadius.circular(99),
          ),
          alignment: Alignment.centerLeft,
          child: Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              gradient: const LinearGradient(
                colors: [
                  AppColors.barStart,
                  AppColors.barMid,
                  AppColors.barEnd,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _WhiteCard extends StatelessWidget {
  const _WhiteCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFF3EBE4)),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
        child: child,
      ),
    );
  }
}
