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

  String toCapitalized() {
    if (isBlank) return '';

    if (this!.length == 1) return this!.toUpperCase();

    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }
}
