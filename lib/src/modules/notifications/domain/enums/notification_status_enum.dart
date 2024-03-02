enum NotificationStatus {
  read,
  unread;

  factory NotificationStatus.fromIndex(int index) =>
      NotificationStatus.values[index];
}
