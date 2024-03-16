import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/constants/text_constants.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/services/snackbar/snackbar_service.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/utils/hide_keyboard.dart';
import '../../../home/ui/pages/home_page.dart';
import '../../../questions/ui/pages/question_page.dart';
import '../store/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    this.from,
  });

  static String get route => '/auth';

  final String? from;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginStore store;

  final formKey = GlobalKey<FormState>();

  bool validateForm() => formKey.currentState?.validate() != true;

  Future<void> submit() async {
    hideKeyboard();

    if (validateForm()) return;

    final result = await store.submit();

    if (!mounted) return;

    if (result.isError()) {
      SnackBarService.show(
        context,
        text: result.exceptionOrNull()!.message,
        type: SnackBarType.error,
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
            onPressed: () => context.push(QuestionPage.route),
            splashColor: Colors.transparent,
            icon: Icon(
              PhosphorIconsRegular.question,
              color: MonoChromaticColors.gray,
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
                      style: Heading4Typography(
                        fontWeight: FontWeight.w600,
                        color: MonoChromaticColors.gray.v800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Utilize o número do seu RA para realizar o login.',
                      style: Text2Typography(
                        color: MonoChromaticColors.gray.v600,
                      ),
                    ),
                    const SizedBox(height: 24),
                    DefaultTextField(
                      label: 'RA (Registro do Aluno)',
                      hintText: '00123456',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: Validatorless.required(TextConstants.requiredField),
                      onChanged: store.changeLogin,
                    ),
                    const SizedBox(height: 20),
                    DefaultTextField.password(
                      label: 'Senha',
                      hintText: 'Senha',
                      textInputAction: TextInputAction.done,
                      validator: Validatorless.required(TextConstants.requiredField),
                      onChanged: store.changePassword,
                      onFieldSubmitted: (_) => submit(),
                    ),
                    const SizedBox(height: 20),
                    DefaultCheckboxTile(
                      title: 'Permanecer logado',
                      value: store.stayLogged,
                      onChanged: store.changeStayLogged,
                    ),
                    const SizedBox(height: 56),
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
