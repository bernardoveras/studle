class RegexUtils {
  static final zipCodeRegex = RegExp(r'^(\d{5})(\d{3})$');
  static String Function(Match m) get zipCodeMap =>
      (Match m) => '${m[1]}-${m[2]}';

  static final cnpj = RegExp(r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$');
  static String Function(Match m) get cnpjMap =>
      (Match m) => '${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}';

  static final cpf = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');
  static String Function(Match m) get cpfMap =>
      (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}';
}
