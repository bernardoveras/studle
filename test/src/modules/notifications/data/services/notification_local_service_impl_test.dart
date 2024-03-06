import 'package:flutter_test/flutter_test.dart';

/// 🕔 Unit Test Progress
///
/// 🕔 [fetch] Success
/// 🕔 [fetch] Return empty list when notifications do not exist in local storage
/// 🕔 [fetch] Return error if the local storage read method returns error
/// 🕔 [fetch] Return error if local storage method returns a type other than List
///
/// 🕔 [markAsRead] Success
/// 🕔 [markAsRead] Return error if the local storage read method returns error
/// 🕔 [markAsRead] Return error if the local storage write method returns error
/// 🕔 [markAsRead] Return error if local storage method returns a type other than List
/// 🕔 [markAsRead] Return error if notification list does not contain id
void main() {
  test('', () async {
    // TODO: Implement test
  });
}
