import 'package:result_dart/result_dart.dart';

import '../../../../exceptions/exceptions.dart';

abstract interface class ILocalStorageService {
  AsyncResult<T, GenericException> read<T extends Object>(String key);
  AsyncResult<bool, GenericException> delete(String key);
  AsyncResult<bool, GenericException> deleteAll();
  AsyncResult<bool, GenericException> write<T extends Object?>(
    String key,
    T? value,
  );
}
