import 'exceptions.dart';

class NotFoundException extends GenericException {
  NotFoundException({
    super.message = 'Não encontrado.',
    super.error,
  });
}
