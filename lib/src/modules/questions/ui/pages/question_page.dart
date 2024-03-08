import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/image_source_constants.dart';
import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/design_system/widgets/default_expansion_tile.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/user_session.dart';
import '../../../../core/utils/encode_query_parameters.dart';
import '../../../../core/utils/redirect_to_url.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  static String get route => '/question';

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late final UserSession session;

  Future<void> sendEmail({
    String? subject,
    String? body,
  }) async {
    const email = 'contato@bernardoveras.com.br';

    final uri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      }),
    );

    log(uri.toString());

    await launchUrl(uri);

    // await redirectToUrl(query);
  }

  @override
  void initState() {
    super.initState();

    session = Injector.resolve();
  }

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
        child: SolidButton.primary(
          label: 'Preciso de ajuda',
          icon: PhosphorIconsRegular.question,
          style: SolidButtonStyle.outlined,
          onPressed: () => redirectToUrl(
            'https://github.com/bernardoveras/myschool/discussions/new/choose',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 32,
          bottom: 16 + context.bottomPadding,
        ),
        child: Column(
          children: [
            Image.asset(
              ImageSourceConstants.support,
            ),
            const SizedBox(height: 32),
            const DefaultExpansionTile(
              title: 'Número do meu RA',
              description:
                  'Você pode encontrar seu número de RA, tanto na sua carteirinha de estudante quanto nos documentos dados a você após matrícula.',
            ),
            const DefaultExpansionTile(
              title: 'Minha senha',
              description: 'A senha padrão é o seu CPF.',
            ),
            if (session.isLogged)
              DefaultExpansionTile(
                title: 'Trocar de senha',
                description:
                    'Não é possível trocar sua senha pelo aplicativo, se deseja ajuda com sua senha, envie um e-mail para o suporte.',
                textButton: 'Entrar em contato',
                iconButton: PhosphorIconsRegular.envelopeSimple,
                onPressedButton: () => sendEmail(
                  subject: 'Trocar de senha',
                  body: () {
                    final user = session.user!;
                    return '''Prezados Senhores,
Solicito a troca da senha da minha conta, vinculada ao RA ${user.registrationNumber}.
Agradeço a atenção e aguardo retorno com as instruções para realizar a troca.\n
Atenciosamente,
${user.name}''';
                  }(),
                ),
              ),
            DefaultExpansionTile(
              title: 'Problemas com login',
              description:
                  'Caso esteja tendo problemas com o seu login, clique no botão abaixo para obter ajuda ou envie um e-mail para o suporte.',
              textButton: 'Entrar em contato',
              iconButton: PhosphorIconsRegular.envelopeSimple,
              onPressedButton: () => sendEmail(
                subject: 'Problemas com login',
                body: () {
                  return '''Prezados Senhores,
Estou tendo dificuldades para realizar o login na minha conta.
Agradeço a atenção e aguardo retorno com as instruções para entrar na minha conta.''';
                }(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
