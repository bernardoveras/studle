import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../enums/notification_link_type_enum.dart';
import '../enums/notification_status_enum.dart';

class NotificationEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final NotificationStatus status;
  final String? link;
  final NotificationLinkType? linkType;
  final DateTime createdAt;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    this.link,
    this.linkType,
    required this.createdAt,
  }) : assert(
          link == null && linkType == null,
          'You must only enter the link and the type of link',
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'status': status.index,
      'link': link,
      'linkType': linkType?.index,
      'createdAt': createdAt.toIso8601String(),
    };

    return result;
  }

  factory NotificationEntity.fromMap(Map<String, dynamic> map) {
    return NotificationEntity(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: NotificationStatus.fromIndex(map['status']),
      link: map['link'],
      linkType: map['linkType'] != null
          ? NotificationLinkType.fromIndex(map['linkType'])
          : null,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationEntity.fromJson(String source) =>
      NotificationEntity.fromMap(json.decode(source));

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      status,
      link,
      linkType,
      createdAt,
    ];
  }
}
