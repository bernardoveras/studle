import 'exceptions.dart';

class UnknowException extends GenericException {
  UnknowException({
    super.message = 'Erro desconhecido.',
  });
}
