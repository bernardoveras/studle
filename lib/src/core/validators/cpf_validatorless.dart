import '../constants/text_constants.dart';
import '../extensions/string_extension.dart';
import '../helpers/cpf_helper.dart';

abstract class CpfValidatorless {
  static String? validate(String? value) {
    if (value.isBlank) {
      return null;
    }

    if (!CpfHelper.isValid(value)) {
      return TextConstants.invalidCpf;
    }

    return null;
  }
}
