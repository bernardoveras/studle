import 'exceptions.dart';

class InvalidCredentialsException extends UnauthorizedException {
  InvalidCredentialsException({
    super.message = 'Login e/ou senha incorretos.',
  });
}
