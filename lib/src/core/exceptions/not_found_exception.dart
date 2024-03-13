import 'exceptions.dart';

class NotFoundException extends GenericException {
  const NotFoundException({
    super.message = 'Não encontrado.',
    super.error,
  });
}
