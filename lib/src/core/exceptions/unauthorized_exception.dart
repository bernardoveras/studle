import 'exceptions.dart';

class UnauthorizedException extends GenericException {
  const UnauthorizedException({
    super.message = 'Sessão expirada.',
  });
}
