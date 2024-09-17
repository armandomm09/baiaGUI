import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatCurrency(var amount,
    {String locale = 'es_MX', String symbol = '\$'}) {
  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: locale, symbol: symbol);
  return currencyFormatter.format(amount);
}

double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
  final width = MediaQuery.of(context).size.width;
  double val = (width / 1200) * maxTextScaleFactor;
  return max(1, min(val, maxTextScaleFactor));
}
