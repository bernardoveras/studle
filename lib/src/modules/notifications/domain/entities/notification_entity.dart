import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../core/utils/nullable_value.dart';
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

  bool get isRead => status == NotificationStatus.read;

  const NotificationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    this.link,
    this.linkType,
    required this.createdAt,
  }) : assert(
          (link != null && linkType != null) ||
              (link == null && linkType == null),
          'You must either provide both a link and link type, or neither.',
        );

  NotificationEntity copyWith({
    String? title,
    String? description,
    NotificationStatus? status,
    NullableValue<String?>? link,
    NullableValue<NotificationLinkType?>? linkType,
  }) {
    return NotificationEntity(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      link: link != null ? link.value : this.link,
      linkType: linkType != null ? linkType.value : this.linkType,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'status': status.index,
      'link': link,
      'link_type': linkType?.index,
      'created_at': createdAt.toIso8601String(),
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
      linkType: map['link_type'] != null
          ? NotificationLinkType.fromIndex(map['link_type'])
          : null,
      createdAt: DateTime.parse(map['created_at']),
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
