import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_planning_app/app/app.dart';
import 'package:wedding_planning_app/data/models/dashboard_data.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  tearDown(Get.reset);

  test('sample budget matches the dashboard design', () {
    final budget = DashboardData.sample.budget;
    expect(budget.remaining, 640000);
    expect(budget.spentFraction, closeTo(1940000 / 2580000, 0.0001));
  });

  test('dashboard json maps to the same sample values', () {
    final data = DashboardData.fromJson(DashboardData.sample.toJson());

    expect(data.wedding.coupleNames, 'Dilini & Roshan');
    expect(data.wedding.daysLeft, 38);
    expect(data.budget.total, 2580000);
    expect(data.nextReminder?.title, 'Second Facial Appointment');
    expect(data.nextReminder?.timeLabel, '10:00 AM');
  });

  testWidgets('dashboard shows sample wedding data', (tester) async {
    await tester.pumpWidget(const WeddingApp());
    await tester.pumpAndSettle();

    expect(find.text('Dilini & Roshan'), findsOneWidget);
    expect(find.text('YOUR SPECIAL DAY'), findsOneWidget);
    expect(find.text('38'), findsOneWidget);
    expect(find.text('DAYS LEFT'), findsOneWidget);
    expect(
      find.text('Saturday, 18 October 2025 · Temple Trees'),
      findsOneWidget,
    );
    expect(find.text('LKR 2,580,000'), findsOneWidget);
    expect(find.text('LKR 1,940,000 spent'), findsOneWidget);
    expect(find.text('LKR 640,000 remaining'), findsOneWidget);
    expect(find.text('Second Facial Appointment'), findsOneWidget);
    expect(find.text('Luxe Beauty Salon, Colombo 03'), findsOneWidget);
    expect(find.text('5 Sep 2025'), findsOneWidget);
    expect(find.text('10:00 AM'), findsOneWidget);
  });

  testWidgets('bottom navigation switches away from home and back', (
    tester,
  ) async {
    await tester.pumpWidget(const WeddingApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Guests'));
    await tester.pumpAndSettle();

    expect(find.text('Dilini & Roshan'), findsNothing);
    expect(find.byKey(const ValueKey('tab-Guests')), findsOneWidget);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.text('Dilini & Roshan'), findsOneWidget);
  });
}
