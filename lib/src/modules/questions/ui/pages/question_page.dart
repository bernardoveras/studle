import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/constants/image_source_constants.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/design_system/widgets/default_expansion_tile.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/utils/redirect_to_url.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key});

  static String get route => '/question';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Dúvidas Frequentes',
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16 + context.bottomPadding,
        ),
        child: Animate(
          delay: 500.ms,
          effects: const [FadeEffect(curve: Curves.ease)],
          child: SolidButton.primary(
            label: 'Preciso de ajuda',
            icon: PhosphorIconsRegular.question,
            style: SolidButtonStyle.outlined,
            onPressed: () => redirectToUrl(
              'https://github.com/bernardoveras/myschool/discussions/new/choose',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 16 + context.bottomPadding,
        ),
        child: Column(
          children: [
            Image.asset(
              ImageSourceConstants.question,
            ),
            const SizedBox(height: 32),
            const DefaultExpansionTile(
              title: 'Número do meu RA',
              description:
                  'Você pode encontrar seu número de RA, tanto na sua carteirinha de estudante quanto nos documentos dados a você após matrícula.',
            ),
            const DefaultExpansionTile(
              title: 'Minha senha',
              description: 'A senha padrão é seu CPF.',
            ),
            const DefaultExpansionTile(
              title: 'Trocar de senha',
              description:
                  'Não é possível trocar sua senha pelo aplicativo, se deseja ajuda com sua senha, compareça no Apoio 1 na Sala 006.',
            ),
            const DefaultExpansionTile(
              title: 'Problemas com login',
              description:
                  'Caso esteja tendo problemas com o seu login, clique no botão abaixo para obter ajuda ou compareça pessoalmente no Apoio 1 na Sala 006.',
            )
          ],
        ),
      ),
    );
  }
}
