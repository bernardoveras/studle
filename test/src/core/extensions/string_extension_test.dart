import 'package:flutter_test/flutter_test.dart';
import 'package:studle/src/core/extensions/string_extension.dart';

void main() {
  group('isBlank', () {
    test('Returns true when the value is blank', () {
      const value = '';
      expect(value.isBlank, true);
    });

    test('Returns true when the value empty space', () {
      const value = ' ';
      expect(value.isBlank, true);
    });

    test('Returns false when the value is not blank', () {
      const value = 'valid-value';
      expect(value.isBlank, false);
    });
  });

  group('isNotBlank', () {
    test('Returns true when the value is not blank', () {
      const value = 'valid-value';
      expect(value.isNotBlank, true);
    });

    test('Returns false when the value is blank', () {
      const value = '';
      expect(value.isNotBlank, false);
    });

    test('Returns false when the value empty space', () {
      const value = ' ';
      expect(value.isNotBlank, false);
    });
  });

  group('removeWhiteSpace', () {
    test('Returns the value without empty space', () {
      const value = ' valid   value ';
      expect(value.removeWhiteSpace(), 'validvalue');
    });
  });

  group('removeSpecialCharacters', () {
    test('Returns the value without special characters', () {
      const value = '!@#\$%^&*()_+value123{}|:"<>?';
      expect(value.removeSpecialCharacters(), 'value123');
    });
  });

  group('capitalize', () {
    test('Returns the value with the first letter capitalized', () {
      const value = 'value not capitalize';
      expect(value.capitalize(), 'Value not capitalize');
    });
  });
}
