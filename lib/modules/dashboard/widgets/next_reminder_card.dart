import 'package:flutter/material.dart';
import 'package:wedding_planning_app/core/theme/app_colors.dart';
import 'package:wedding_planning_app/core/theme/app_text_styles.dart';
import 'package:wedding_planning_app/data/models/wedding_reminder.dart';

class NextReminderCard extends StatelessWidget {
  const NextReminderCard({super.key, required this.reminder});

  final WeddingReminder reminder;

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
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.blush,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.notifications_rounded,
                color: AppColors.blushIcon,
                size: 26,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reminder.title,
                    style: AppTextStyles.label(
                      size: 15.5,
                      weight: FontWeight.w700,
                      color: AppColors.ink,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    reminder.location,
                    style: AppTextStyles.label(
                      size: 13,
                      weight: FontWeight.w500,
                      color: AppColors.inkSoft,
                      letterSpacing: 0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        reminder.dateLabel,
                        style: AppTextStyles.label(
                          size: 12.5,
                          weight: FontWeight.w700,
                          color: AppColors.date,
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '   ·   ',
                        style: AppTextStyles.label(
                          size: 12.5,
                          weight: FontWeight.w700,
                          color: AppColors.muted,
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        reminder.timeLabel,
                        style: AppTextStyles.label(
                          size: 12.5,
                          weight: FontWeight.w500,
                          color: AppColors.inkSoft,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
