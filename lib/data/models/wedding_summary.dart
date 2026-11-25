class WeddingSummary {
  const WeddingSummary({
    required this.coupleNames,
    required this.dateLabel,
    required this.venue,
    required this.daysLeft,
  });

  final String coupleNames;
  final String dateLabel;
  final String venue;
  final int daysLeft;

  String get dateAndVenue => '$dateLabel · $venue';

  factory WeddingSummary.fromJson(Map<String, dynamic> json) {
    return WeddingSummary(
      coupleNames: json['coupleNames'] as String,
      dateLabel: json['dateLabel'] as String,
      venue: json['venue'] as String,
      daysLeft: (json['daysLeft'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coupleNames': coupleNames,
      'dateLabel': dateLabel,
      'venue': venue,
      'daysLeft': daysLeft,
    };
  }
}
