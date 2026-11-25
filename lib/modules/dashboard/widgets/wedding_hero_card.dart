import 'package:flutter/material.dart';
import 'package:wedding_planning_app/core/theme/app_colors.dart';
import 'package:wedding_planning_app/core/theme/app_text_styles.dart';
import 'package:wedding_planning_app/data/models/wedding_summary.dart';
import 'package:wedding_planning_app/modules/dashboard/widgets/blossom.dart';

class WeddingHeroCard extends StatelessWidget {
  const WeddingHeroCard({super.key, required this.wedding});

  final WeddingSummary wedding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFFBF8),
            Color(0xFFFDEFE6),
            Color(0xFFF6E0D2),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          children: [
            const Positioned(
              top: -16,
              right: -12,
              child: Blossom(size: 96),
            ),
            const Positioned(
              right: 34,
              bottom: 16,
              child: Blossom(
                size: 52,
                petalColor: Color(0xFFF6D0D2),
                innerPetalColor: Color(0xFFFBE4E4),
                centerColor: Color(0xFFEAB0B4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YOUR SPECIAL DAY',
                    style: AppTextStyles.label(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    wedding.coupleNames,
                    style: AppTextStyles.display(
                      size: 32,
                      weight: FontWeight.w700,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(right: 72),
                    child: Text(
                      wedding.dateAndVenue,
                      style: AppTextStyles.label(
                        size: 13.5,
                        weight: FontWeight.w500,
                        color: AppColors.inkSoft,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          '${wedding.daysLeft}',
                          style: AppTextStyles.display(
                            size: 42,
                            weight: FontWeight.w500,
                            color: AppColors.roseDeep,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'DAYS LEFT',
                          style: AppTextStyles.label(letterSpacing: 2.2),
                        ),
                      ],
                    ),
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
