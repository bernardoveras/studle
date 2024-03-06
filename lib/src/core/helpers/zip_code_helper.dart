import '../extensions/string_extension.dart';
import '../utils/regex_utils.dart';

abstract class ZipCodeHelper {
  static String strip(String? cep) => cep.removeSpecialCharacters();

  static String format(String? cep) {
    return strip(cep)
        .replaceAllMapped(RegexUtils.zipCodeRegex, RegexUtils.zipCodeMap);
  }

  static bool isValid(String? cep) {
    cep = strip(cep);

    if (cep.isEmpty || cep.length != 8) {
      return false;
    }

    return true;
  }
}
