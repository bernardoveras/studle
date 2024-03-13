import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../core/constants/text_constants.dart';
import '../../../../../core/extensions/build_context_extension.dart';
import '../../../../../core/ui/design_system/design_system.dart';
import 'share_boleto_store.dart';

class ShareBoletoModal extends StatefulWidget {
  const ShareBoletoModal({
    super.key,
  });

  @override
  State<ShareBoletoModal> createState() => _ShareBoletoModalState();
}

class _ShareBoletoModalState extends State<ShareBoletoModal> {
  late final ShareBoletoStore store;

  Future<void> submit() async {
    final result = await store.submit();

    if (!mounted) return;

    if (result.isSuccess()) {
      return context.pop(true);
    }
  }

  @override
  void initState() {
    super.initState();
    store = ShareBoletoStore();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultModal(
      title: 'Boleto',
      child: Expanded(
        child: ListenableBuilder(
          listenable: store,
          builder: (_, __) {
            return IgnorePointer(
              ignoring: store.loading,
              child: Scaffold(
                bottomSheet: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SolidButton.primary(
                    label: 'Enviar',
                    onPressed: store.isValid ? submit : null,
                    loading: store.loading,
                  ),
                ),
                body: Form(
                  key: store.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 16,
                      right: 16,
                      left: 16,
                      bottom: 16 + context.bottomPadding,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DefaultTextField.email(
                            label: 'E-mail',
                            hintText: 'seuemail@endereço.com',
                            onChanged: store.changeEmail,
                            validator: Validatorless.required(
                              TextConstants.requiredField,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Você receberá em até 5 minutos o seu boleto. Caso não receba, verifique seu lixo eletrônico ou spam!',
                            style: Text3Typography(
                              fontWeight: FontWeight.w400,
                              color: MonoChromaticColors.gray.v600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
