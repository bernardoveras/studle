import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:studle/src/core/helpers/date_helper.dart';

void main() {
  setUpAll(() async {
    Intl.defaultLocale = 'pt_BR';
    await initializeDateFormatting('pt_BR');
  });
  group('Format', () {
    test('Format with default pattern', () {
      final date = DateTime(2024, 3, 1, 12, 30);

      final formattedString = DateHelper.format(date);

      expect(formattedString, '01/03/2024');
    });

    test('Format with custom pattern', () {
      final date = DateTime(2024, 3, 1, 12, 30);

      final formattedString =
          DateHelper.format(date, pattern: 'dd/MM/yyyy HH:mm:ss');

      expect(formattedString, '01/03/2024 12:30:00');
    });
  });

  group('TryParse', () {
    test('Parse with default pattern', () {
      final expectedDate = DateTime(2024, 3, 1);

      final dateParsed = DateHelper.tryParse('01/03/2024');

      expect(dateParsed, expectedDate);
    });

    test('Parse with custom pattern', () {
      final expectedDate = DateTime(2024, 3, 1, 12, 30);

      final dateParsed = DateHelper.tryParse(
        '01/03/2024 12:30:00',
        pattern: 'dd/MM/yyyy HH:mm:ss',
      );

      expect(dateParsed, expectedDate);
    });

    test('Parse with invalid input', () {
      final dateParsed = DateHelper.tryParse('invalid-date');

      expect(dateParsed, null);
    });
  });
}
