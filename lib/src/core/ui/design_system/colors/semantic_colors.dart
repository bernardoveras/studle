import 'base_color.dart';

final class SemanticColors {
  static BaseColor get warning => BaseColor(const <int, String>{
        100: '#FDF4E7',
        500: '#E99537',
      });

  static BaseColor get negative => BaseColor(const <int, String>{
        100: '#FBE8E6',
        500: '#DE5242',
      });

  static BaseColor get positive => BaseColor(const <int, String>{
        100: '#EAFEF4',
        500: '#54B471',
      });
}
