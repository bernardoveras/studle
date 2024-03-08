import '../constants/text_constants.dart';

abstract class DateValidatorless {
  static final RegExp _dateRegExp = RegExp(
    r'^(((0[1-9]|[12][0-9]|30)[-/]?(0[13-9]|1[012])|31[-/]?(0[13578]|1[02])|(0[1-9]|1[0-9]|2[0-8])[-/]?02)[-/]?[0-9]{4}|29[-/]?02[-/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$',
  );

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!_dateRegExp.hasMatch(value)) {
      return TextConstants.invalidDate;
    }

    return null;
  }
}
