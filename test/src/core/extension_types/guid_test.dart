import 'package:flutter_test/flutter_test.dart';
import 'package:myschool/src/core/extension_types/guid.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('Create by default constructor', () {
    final expectedGuid = const Uuid().v4();

    final guid = Guid(expectedGuid);

    expect(guid, expectedGuid);
  });

  test('Create by default constructor with empty', () {
    final guid = Guid();

    expect(guid.isEmpty, false);
  });

  test('Create by default constructor with null', () {
    final guid = Guid(null);

    expect(guid.isEmpty, false);
  });

  test('Create empty guid', () {
    const expectedGuid = '00000000-0000-0000-0000-000000000000';

    final guid = Guid.empty();

    expect(guid, expectedGuid);
  });

  test('Create random guid', () {
    final guid = Guid.random();

    expect(guid.isEmpty, false);
  });

  test('Guid is empty', () {
    final guid = Guid.empty();

    expect(guid.isEmpty, true);
  });

  test('Guid is not empty', () {
    final guid = Guid.random();

    expect(guid.isNotEmpty, true);
  });

  test('Throws assertion error when create invalid guid', () {
    expect(() => Guid('invalid-guid'), throwsA(isA<AssertionError>()));
  });
}
