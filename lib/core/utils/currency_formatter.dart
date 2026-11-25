String formatCurrency(int amount, {String currency = 'LKR'}) {
  final negative = amount < 0;
  final digits = amount.abs().toString();
  final buffer = StringBuffer();

  for (var i = 0; i < digits.length; i++) {
    final placesLeft = digits.length - i;
    if (i > 0 && placesLeft % 3 == 0) {
      buffer.write(',');
    }
    buffer.write(digits[i]);
  }

  return '${negative ? '-' : ''}$currency $buffer';
}
