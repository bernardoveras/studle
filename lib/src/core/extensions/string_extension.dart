extension StringExtension on String? {
  bool get isBlank => this?.trim().isEmpty ?? true;
  bool get isNotBlank => isBlank == false;

  String removeWhiteSpace() {
    if (isBlank) return '';
    return this!.replaceAll(' ', '');
  }

  String removeSpecialCharacters() {
    if (isBlank) return '';

    final regex = RegExp('[^A-Za-z0-9]');

    return this!.replaceAll(regex, '').removeWhiteSpace();
  }
}
