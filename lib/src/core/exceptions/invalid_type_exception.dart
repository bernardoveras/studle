import 'exceptions.dart';

class InvalidTypeException extends GenericException {
  const InvalidTypeException({
    super.message = 'O tipo informado é inválido.',
    super.error,
  });
}
