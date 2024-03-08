import '../../../../exceptions/exceptions.dart';

class ImageNotChosenException extends GenericException {
  ImageNotChosenException({
    super.message = 'Imagem não escolhida.',
    super.error,
  });
}
