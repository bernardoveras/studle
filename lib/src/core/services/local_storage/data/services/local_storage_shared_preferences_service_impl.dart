import 'dart:convert';

import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../exceptions/exceptions.dart';
import '../../domain/services/i_local_storage_service.dart';

class LocalStorageSharedPreferencesServiceImpl implements ILocalStorageService {
  final SharedPreferences sharedPreferences;

  LocalStorageSharedPreferencesServiceImpl({
    required this.sharedPreferences,
  });

  @override
  AsyncResult<bool, GenericException> delete(String key) async {
    try {
      final deleted = await sharedPreferences.remove(key);

      if (!deleted) {
        return Failure(UnknowException());
      }

      return Success(deleted);
    } catch (e) {
      return Failure(
        UnknowException(
          message: e.toString(),
          error: e,
        ),
      );
    }
  }

  @override
  AsyncResult<T, GenericException> read<T extends Object>(String key) async {
    try {
      final result = switch (T.runtimeType) {
        const (bool) => sharedPreferences.getBool(key),
        const (double) => sharedPreferences.getDouble(key),
        const (int) => sharedPreferences.getInt(key),
        const (List<String>) => sharedPreferences.getStringList(key),
        const (Map<String, dynamic>) => () {
            final result = sharedPreferences.getString(key);
            if (result == null) return null;

            return (jsonDecode(result) as Map).cast<String, dynamic>();
          }(),
        _ => sharedPreferences.getString(key),
      };

      if (result == null) {
        return Failure(NotFoundException(
          message: "Key '$key' não encontrada.",
        ));
      }

      return Success(result as T);
    } catch (e) {
      return Failure(
        UnknowException(
          message: e.toString(),
          error: e,
        ),
      );
    }
  }

  @override
  AsyncResult<bool, GenericException> write<T extends Object>(
    String key,
    T value,
  ) async {
    try {
      final writed = switch (value.runtimeType) {
        const (bool) => await sharedPreferences.setBool(key, value as bool),
        const (double) =>
          await sharedPreferences.setDouble(key, value as double),
        const (int) => await sharedPreferences.setInt(key, value as int),
        const (List<String>) =>
          await sharedPreferences.setStringList(key, value as List<String>),
        const (Map<dynamic, dynamic>) =>
          await sharedPreferences.setString(key, jsonEncode(value)),
        _ => await sharedPreferences.setString(key, value.toString()),
      };

      if (!writed) {
        return Failure(UnknowException());
      }

      return Success(writed);
    } catch (e) {
      return Failure(
        UnknowException(
          message: e.toString(),
          error: e,
        ),
      );
    }
  }
}
