extension DateExtension on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  bool isToday() {
    return dateOnly == DateTime.now().dateOnly;
  }

  DateTime lastTimeOfDay() {
    return DateTime(year, month, day, 23, 59, 59);
  }
}
