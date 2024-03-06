import '../constants/text_constants.dart';
import '../extensions/string_extension.dart';
import '../helpers/zip_code_helper.dart';

abstract class CepValidatorless {
  static String? validate(String? value) {
    if (value.isBlank) {
      return null;
    }

    if (!ZipCodeHelper.isValid(value)) {
      return TextConstants.invalidZipCode;
    }

    return null;
  }
}
