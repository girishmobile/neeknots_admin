String formatPrice(dynamic price, {String currency = "\$"}) {
  final value = (price is double)
      ? price
      : double.tryParse(price.toString()) ?? 0.0;
  return "$currency${value.toStringAsFixed(2)}";
}
