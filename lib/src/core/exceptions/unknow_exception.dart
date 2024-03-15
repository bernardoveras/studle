import 'exceptions.dart';

class UnknowException extends GenericException {
  const UnknowException({
    super.message = 'Erro desconhecido.',
    super.error,
  });
}
