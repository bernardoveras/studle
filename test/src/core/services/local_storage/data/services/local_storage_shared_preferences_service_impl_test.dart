import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studle/src/core/exceptions/not_found_exception.dart';
import 'package:studle/src/core/services/local_storage/data/services/local_storage_shared_preferences_service_impl.dart';
import 'package:studle/src/core/services/local_storage/domain/services/i_local_storage_service.dart';

void main() {
  late final ILocalStorageService localStorageService;
  late final SharedPreferences sharedPreferences;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({
      'key1': true,
      'key2': 10.5,
      'key3': 10,
      'key4': ['value'],
      'key5': {'key': 'value'},
      'key6': 'value',
    });

    sharedPreferences = await SharedPreferences.getInstance();
    localStorageService = LocalStorageSharedPreferencesServiceImpl(
      sharedPreferences: sharedPreferences,
    );
  });

  group('Delete', () {
    test('Delete existing key', () async {
      var expectedValue = sharedPreferences.getBool('key1');

      expect(expectedValue, true);

      final result = await localStorageService.delete('key1');

      expectedValue = sharedPreferences.getBool('key1');

      expect(result.isSuccess(), true);
      expect(expectedValue, null);
    });

    test('Delete non-existent key', () async {
      var expectedValue = sharedPreferences.getBool('non-existent');

      expect(expectedValue, null);

      final result = await localStorageService.delete('non-existent');

      expectedValue = sharedPreferences.getBool('non-existent');

      expect(result.isSuccess(), true);
      expect(expectedValue, null);
    });

    test('Delete all', () async {
      var expectedValue = sharedPreferences.getString('key6');

      expect(expectedValue, 'value');

      final result = await localStorageService.deleteAll();

      expectedValue = sharedPreferences.getString('key6');

      expect(result.isSuccess(), true);
      expect(expectedValue, null);
    });
  });

  group('Read', () {
    test('Read existing key without type', () async {
      final result = await localStorageService.read('key1');

      final expectedValue = sharedPreferences.getBool('key1');

      expect(result.getOrNull(), expectedValue);
    });

    test('Read non-existent key and throw NotFoundException error', () async {
      final result = await localStorageService.read('non-existent');

      expect(result.exceptionOrNull(), isA<NotFoundException>());
    });

    test('Read existing key of type bool', () async {
      final result = await localStorageService.read<bool>('key1');

      final expectedValue = sharedPreferences.getBool('key1');

      expect(result.getOrNull(), expectedValue);
    });

    test('Read existing key of type double', () async {
      final result = await localStorageService.read<double>('key2');

      final expectedValue = sharedPreferences.getDouble('key2');

      expect(result.getOrNull(), expectedValue);
    });

    test('Read existing key of type int', () async {
      final result = await localStorageService.read<int>('key3');

      final expectedValue = sharedPreferences.getInt('key3');

      expect(result.getOrNull(), expectedValue);
    });

    test('Read existing key of type List<String>', () async {
      final result = await localStorageService.read<List<String>>('key4');

      final expectedValue = sharedPreferences.getStringList('key4');

      expect(result.getOrNull(), expectedValue);
    });

    test('Read existing key of type Map<String, dynamic>', () async {
      final result =
          await localStorageService.read<Map<String, dynamic>>('key5');

      final expectedValue = sharedPreferences.get('key5');

      expect(result.getOrNull(), expectedValue);
    });

    test('Read existing key of type Map<String, dynamic>', () async {
      final result = await localStorageService.read<String>('String');

      final expectedValue = sharedPreferences.getString('String');

      expect(result.getOrNull(), expectedValue);
    });
  });

  group('Write', () {
    test('Write to key without type', () async {
      final result = await localStorageService.write('new-key', 10.5);

      final expectedValue = sharedPreferences.get('new-key');

      expect(result.isSuccess(), true);
      expect(expectedValue, 10.5);
    });

    test('Write to key with type bool', () async {
      final result =
          await localStorageService.write<bool>('new-key-bool', true);

      final expectedValue = sharedPreferences.get('new-key-bool');

      expect(result.isSuccess(), true);
      expect(expectedValue, true);
    });

    test('Write to key with type double', () async {
      final result =
          await localStorageService.write<double>('new-key-double', 10.5);

      final expectedValue = sharedPreferences.get('new-key-double');

      expect(result.isSuccess(), true);
      expect(expectedValue, 10.5);
    });

    test('Write to key with type int', () async {
      final result = await localStorageService.write<int>('new-key-int', 10);

      final expectedValue = sharedPreferences.get('new-key-int');

      expect(result.isSuccess(), true);
      expect(expectedValue, 10);
    });

    test('Write to key with type List<String>', () async {
      final result = await localStorageService
          .write<List<String>>('new-key-list-string', ['value']);

      final expectedValue = sharedPreferences.get('new-key-list-string');

      expect(result.isSuccess(), true);
      expect(expectedValue, ['value']);
    });
    test('Write to key with type Map<String, dynamic>', () async {
      final result = await localStorageService
          .write<Map<String, dynamic>>('new-key-map', {'key': 'value'});

      final expectedValue = sharedPreferences.get('new-key-map');

      expect(result.isSuccess(), true);
      expect(expectedValue, jsonEncode({'key': 'value'}));
    });

    test('Write to key with type String', () async {
      final result =
          await localStorageService.write<String>('new-key-string', 'value');

      final expectedValue = sharedPreferences.getString('new-key-string');

      expect(result.isSuccess(), true);
      expect(expectedValue, 'value');
    });

    test('Write to key with null value and delete', () async {
      await sharedPreferences.setBool('key1', true);

      var expectedValue = sharedPreferences.getBool('key1');

      expect(expectedValue, true);

      final result = await localStorageService.write('key1', null);

      expectedValue = sharedPreferences.getBool('key1');

      expect(result.isSuccess(), true);
      expect(expectedValue, null);
    });
  });
}
