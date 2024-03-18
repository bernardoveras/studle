import 'package:flutter_test/flutter_test.dart';
import 'package:studle/src/core/utils/nullable_value.dart';

void main() {
  group('Instantiate', () {
    test('Instantiate with value', () {
      const value = NullableValue('value-1');
      expect(value.value, 'value-1');
    });

    test('Instantiate with null value', () {
      const value = NullableValue(null);
      expect(value.value, null);
    });
  });

  group('Equatable', () {
    test('Returns true when the values are the same', () {
      const value1 = NullableValue('value-1');
      const value2 = NullableValue('value-1');

      expect(value1, value2);
    });

    test('Returns false when the values are different', () {
      const value1 = NullableValue('value-1');
      const value2 = NullableValue('value-2');

      expect(value1 != value2, true);
    });

    test('Returns true when the hash code are the same', () {
      const value1 = NullableValue('value-1');
      const value2 = NullableValue('value-1');

      expect(value1.hashCode, value2.hashCode);
    });
  });
}
