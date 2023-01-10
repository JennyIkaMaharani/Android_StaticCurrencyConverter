import 'dart:math';
import 'package:currency_converter/main.dart';
import 'package:flutter/cupertino.dart';
import 'api_client.dart';
import 'package:currency_converter/main.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class CurrencyFormat1 {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

class CurrencyFormat2 {
  static String convertToIUsd(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'en-us',
      symbol: "USD ",
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

class ConvertIt {
  ConvertIt({
    required this.valueInputed,
    required this.currencies,
  });

  final int valueInputed;
  final int currencies;
  double rate1 = 0.000064;
  double rate2 = 15566.65;

  double calculate1() {
    double Result1 = valueInputed * rate1;
    return Result1;
  }

  double calculate2() {
    double Result2 = valueInputed * rate2;
    return Result2;
  }

  int getOption() {
    int selected = currencies;
    return selected;
  }

  String getFinal() {
    int selected = getOption();
    if (selected == 0) {
      double finalResult = calculate1();
      return CurrencyFormat2.convertToIUsd(finalResult, 2);
    } else {
      double finalResult = calculate2();
      return CurrencyFormat1.convertToIdr(finalResult, 2);
    }
  }
}
