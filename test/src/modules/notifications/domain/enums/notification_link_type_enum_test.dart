import 'package:flutter_test/flutter_test.dart';
import 'package:studle/src/modules/notifications/domain/enums/notification_link_type_enum.dart';

void main() {
  test('fromIndex', () {
    const expectedValue1 = NotificationLinkType.redirectToRoute;
    const expectedValue2 = NotificationLinkType.redirectToSite;

    expect(NotificationLinkType.fromIndex(0), expectedValue1);
    expect(NotificationLinkType.fromIndex(1), expectedValue2);
  });
}
