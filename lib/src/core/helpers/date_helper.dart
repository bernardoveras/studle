import 'package:intl/intl.dart';

abstract class DateHelper {
  static String format(DateTime date, [String pattern = 'dd/MM/yyyy']) {
    final formatter = DateFormat(pattern);

    return formatter.format(date);
  }

  static DateTime? tryParse(String input, [String pattern = 'dd/MM/yyyy']) {
    final formatter = DateFormat(pattern);

    try {
      return formatter.parse(input);
    } catch (e) {
      return null;
    }
  }
}
