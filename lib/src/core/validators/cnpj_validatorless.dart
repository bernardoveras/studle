import '../constants/text_constants.dart';
import '../extensions/string_extension.dart';
import '../helpers/cnpj_helper.dart';

abstract class CnpjValidatorless {
  static String? validate(String? value) {
    if (value.isBlank) {
      return null;
    }

    if (!CnpjHelper.isValid(value)) {
      return TextConstants.invalidCnpj;
    }

    return null;
  }
}
