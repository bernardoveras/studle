import 'ui_exception.dart';

class ColorNotFoundException extends UIException {
  ColorNotFoundException({
    super.message = 'Cor não encontrada.',
    super.error,
  });
}
