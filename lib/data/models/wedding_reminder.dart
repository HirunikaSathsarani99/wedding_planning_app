class WeddingReminder {
  const WeddingReminder({
    required this.title,
    required this.location,
    required this.dateLabel,
    required this.timeLabel,
  });

  final String title;
  final String location;
  final String dateLabel;
  final String timeLabel;

  factory WeddingReminder.fromJson(Map<String, dynamic> json) {
    return WeddingReminder(
      title: json['title'] as String,
      location: json['location'] as String,
      dateLabel: json['dateLabel'] as String,
      timeLabel: json['timeLabel'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'location': location,
      'dateLabel': dateLabel,
      'timeLabel': timeLabel,
    };
  }
}
