enum NotificationLinkType {
  redirectToRoute,
  redirectToSite;

  factory NotificationLinkType.fromIndex(int index) =>
      NotificationLinkType.values[index];
}
