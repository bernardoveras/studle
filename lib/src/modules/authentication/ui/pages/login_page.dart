import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/text_constants.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../home/ui/pages/home_page.dart';
import '../store/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  static String get route => '/auth';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginStore store;

  final formKey = GlobalKey<FormState>();

  bool validateForm() => formKey.currentState?.validate() != true;

  Future<void> submit() async {
    if (validateForm()) return;

    final result = await store.submit();

    if (!mounted) return;

    if (result.isError()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result.exceptionOrNull()!.message),
          backgroundColor: SemanticColors.negative,
        ),
      );
      return;
    }

    context.go(HomePage.route);
  }

  @override
  void initState() {
    super.initState();

    store = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      appBar: DefaultAppBar(
        title: 'Login',
        actions: [
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            icon: Icon(
              PhosphorIconsRegular.question,
              color: MonoChromaticColors.dark.v200,
            ),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: store,
        builder: (_, __) {
          return IgnorePointer(
            ignoring: store.loading,
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Insira seus dados',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MonoChromaticColors.dark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Utilize o número do seu RA para realizar o login.',
                      style: TextStyle(
                        fontSize: 16,
                        color: MonoChromaticColors.dark.v300,
                      ),
                    ),
                    const SizedBox(height: 24),
                    DefaultTextField(
                      label: 'RA (Registro do Aluno)',
                      hintText: '00123456',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator:
                          Validatorless.required(TextConstants.requiredField),
                      onChanged: store.changeLogin,
                    ),
                    const SizedBox(height: 20),
                    DefaultTextField.password(
                      label: 'Senha',
                      hintText: 'Senha',
                      textInputAction: TextInputAction.done,
                      validator:
                          Validatorless.required(TextConstants.requiredField),
                      onChanged: store.changePassword,
                      onFieldSubmitted: (_) => submit(),
                    ),
                    const SizedBox(height: 40),
                    SolidButton.primary(
                      label: 'Entrar',
                      onPressed: store.formIsValid ? submit : null,
                      loading: store.loading,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}