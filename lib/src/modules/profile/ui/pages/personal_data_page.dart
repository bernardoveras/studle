import 'package:flutter/material.dart';

import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/user_session.dart';
import '../../../authentication/domain/entities/user_entity.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  static String get route => '/profile/personaldata';
  static String get subRoute => 'personaldata';

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  late final UserSession userSession;

  UserEntity get user => userSession.user!;

  @override
  void initState() {
    super.initState();

    userSession = Injector.resolve();
  }

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Dados pessoais',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 24 + bottomPadding,
        ),
        child: Column(
          children: [
            DefaultTextField(
              label: 'Nome',
              initialValue: user.name,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField.date(
              label: 'Data de nascimento',
              // initialValue: user.birthday,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField(
              label: 'Sexo',
              initialValue: user.gender?.description,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField(
              label: 'RA (Registro do Aluno)',
              initialValue: user.registrationNumber,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField.cpf(
              label: 'CPF',
              initialValue: user.cpf,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField.email(
              label: 'E-mail',
              initialValue: user.email,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField.phoneNumber(
              label: 'Telefone',
              initialValue: user.phoneNumber,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField(
              label: 'Endereço',
              initialValue: user.addressStreet,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField(
              label: 'Número',
              initialValue: user.addressNumber,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField(
              label: 'Bairro',
              initialValue: user.addressNeighborhood,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField(
              label: 'Cidade',
              initialValue: user.addressCity,
              enabled: false,
            ),
            const SizedBox(height: 24),
            DefaultTextField.cep(
              label: 'CEP',
              initialValue: user.addressZipCode,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
