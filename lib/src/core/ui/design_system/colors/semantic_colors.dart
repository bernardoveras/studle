import 'base_color.dart';

final class SemanticColors {
  static BaseColor get warning => BaseColor(const <int, String>{
        100: '#FFF4E5',
        500: '#F79009',
      });

  static BaseColor get negative => BaseColor(const <int, String>{
        100: '#FFE7E5',
        500: '#F7009',
      });

  static BaseColor get positive => BaseColor(const <int, String>{
        100: '#E5FFF3',
        500: '#12B76A',
      });
}
