import 'exceptions.dart';

class UnauthorizedException extends GenericException {
  UnauthorizedException({
    super.message = 'Sessão expirada.',
  });
}
