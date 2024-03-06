import 'package:intl/intl.dart';

abstract class DateHelper {
  static String format(
    DateTime input, {
    String locale = 'pt_BR',
    String pattern = 'dd/MM/yyyy',
  }) {
    final formatter = DateFormat(pattern, locale);

    return formatter.format(input);
  }

  static DateTime? tryParse(
    String input, {
    String locale = 'pt_BR',
    String pattern = 'dd/MM/yyyy',
  }) {
    final formatter = DateFormat(pattern, locale);

    try {
      return formatter.parse(input);
    } catch (e) {
      return null;
    }
  }
}
