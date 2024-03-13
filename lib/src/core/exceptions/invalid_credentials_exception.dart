import 'exceptions.dart';

class InvalidCredentialsException extends UnauthorizedException {
  const InvalidCredentialsException({
    super.message = 'Login e/ou senha incorretos.',
  });
}
