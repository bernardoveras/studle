import '../constants/text_constants.dart';
import '../extensions/string_extension.dart';

abstract class PhoneNumberValidatorless {
  static final RegExp _onlyNumberRegExp = RegExp(r'(^[0-9]*$)');

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    value = value.removeSpecialCharacters();

    if (!_onlyNumberRegExp.hasMatch(value)) {
      return TextConstants.invalidPhone;
    }

    if (value.length < 10 || value.length > 11) {
      return TextConstants.invalidPhone;
    }

    return null;
  }
}
