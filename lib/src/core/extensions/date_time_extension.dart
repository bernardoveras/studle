extension DateExtension on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  bool isToday() {
    return dateOnly == DateTime.now().dateOnly;
  }
}
