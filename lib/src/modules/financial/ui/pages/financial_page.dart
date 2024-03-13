import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/extensions/build_context_extension.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/services/snackbar/snackbar_service.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/ui/widgets/month_picker.dart';
import '../../../../core/utils/copy_text.dart';
import '../widgets/modals/share_boleto_modal.dart';

class FinancialPage extends StatefulWidget {
  const FinancialPage({super.key});

  static String get route => '/financial';

  @override
  State<FinancialPage> createState() => _FinancialPageState();
}

class _FinancialPageState extends State<FinancialPage> {
  int selectedMonth = DateTime.now().month;

  void changeMonth(int value) {
    log('changeMonth: $value');

    setState(() {
      selectedMonth = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Financeiro',
        backgroundColor: PrimaryColors.brand,
        foregroundColor: Colors.white,
        shape: LinearBorder.none,
      ),
      backgroundColor: PrimaryColors.brand,
      body: Column(
        children: [
          IgnorePointer(
            // ignoring: isLoading,
            ignoring: false,
            child: MonthPicker(
              month: selectedMonth,
              changeMonth: changeMonth,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: MonoChromaticColors.backgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: 16,
                    right: 16,
                    left: 16,
                    bottom: 16 + context.bottomPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(
                        avatar: Icon(
                          Icons.check,
                          color: SemanticColors.positive,
                        ),
                        label: Text(
                          'Pago',
                          style: Button2Typography(
                            fontWeight: FontWeight.w600,
                            color: SemanticColors.positive,
                          ),
                        ),
                        backgroundColor: SemanticColors.positive.v100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Setembro de 2023',
                        textAlign: TextAlign.center,
                        style: Button1Typography(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'R\$ 659,50',
                        textAlign: TextAlign.center,
                        style: Heading1Typography(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Vencimento 07 de agosto',
                        textAlign: TextAlign.center,
                        style: Text2Typography(
                          fontWeight: FontWeight.w400,
                          color: MonoChromaticColors.gray,
                        ),
                      ),
                      const SizedBox(height: 80),
                      SolidButton.primary(
                        icon: PhosphorIconsRegular.copy,
                        label: 'Copiar Código de barras',
                        onPressed: () {
                          copyText('001');
                          SnackBarService.show(
                            context,
                            text: 'Código copiado com sucesso!',
                            type: SnackBarType.success,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      SolidButton.primary(
                        label: 'Enviar para o meu e-mail',
                        icon: PhosphorIconsRegular.envelope,
                        style: SolidButtonStyle.outlined,
                        onPressed: () async {
                          final result = await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const ShareBoletoModal(),
                          );
                          if (result == true) {
                            // TODO: Criar a modal genérica de Success
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
