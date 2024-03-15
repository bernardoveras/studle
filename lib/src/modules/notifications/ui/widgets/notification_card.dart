import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/extension_types/guid.dart';
import '../../../../core/helpers/date_helper.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/utils/redirect_to_url.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/enums/notification_link_type_enum.dart';
import '../../domain/enums/notification_status_enum.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
    this.markAsRead,
  });

  final NotificationEntity notification;
  final ValueChanged<Guid>? markAsRead;

  void _markAsRead() {
    if (notification.isRead) return;
    markAsRead?.call(notification.id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (notification.link == null) return;

        if (notification.linkType == NotificationLinkType.redirectToRoute) {
          context.push(notification.link!);
          _markAsRead();

          return;
        }

        if (notification.linkType == NotificationLinkType.redirectToSite) {
          redirectToUrl(notification.link!);
          _markAsRead();
          return;
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Badge(
                        backgroundColor: switch (notification.status) {
                          NotificationStatus.read => MonoChromaticColors.gray.v300,
                          NotificationStatus.unread => SemanticColors.negative,
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(
                        notification.title,
                        style: Text3Typography(
                          fontWeight: FontWeight.w600,
                          color: MonoChromaticColors.gray.v800,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification.description,
                    style: Text3Typography(
                      color: MonoChromaticColors.gray,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    DateHelper.format(
                      notification.createdAt,
                      pattern: "dd 'de' MMM 'às' HH:mm",
                    ),
                    style: Button3Typography(
                      fontWeight: FontWeight.w500,
                      color: MonoChromaticColors.gray.v400,
                    ),
                  ),
                ],
              ),
            ),
            if (notification.link != null) ...{
              const SizedBox(width: 24),
              Icon(
                PhosphorIconsBold.caretRight,
                color: MonoChromaticColors.gray,
                size: 16,
              ),
            }
          ],
        ),
      ),
    );
  }
}
