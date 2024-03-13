import 'package:flutter_test/flutter_test.dart';
import 'package:studle/src/modules/notifications/domain/enums/notification_status_enum.dart';

void main() {
  test('fromIndex', () {
    const expectedValue1 = NotificationStatus.read;
    const expectedValue2 = NotificationStatus.unread;

    expect(NotificationStatus.fromIndex(0), expectedValue1);
    expect(NotificationStatus.fromIndex(1), expectedValue2);
  });
}
