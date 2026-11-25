class BudgetSummary {
  const BudgetSummary({
    required this.currency,
    required this.total,
    required this.spent,
  });

  final String currency;
  final int total;
  final int spent;

  int get remaining => total - spent;

  double get spentFraction {
    if (total <= 0) return 0;
    final fraction = spent / total;
    if (fraction < 0) return 0;
    if (fraction > 1) return 1;
    return fraction;
  }

  factory BudgetSummary.fromJson(Map<String, dynamic> json) {
    return BudgetSummary(
      currency: json['currency'] as String? ?? 'LKR',
      total: (json['total'] as num).toInt(),
      spent: (json['spent'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'total': total,
      'spent': spent,
    };
  }
}
