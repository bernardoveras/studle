import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/ui/widgets/tiles/default_list_tile.dart';
import '../../../../core/user_session.dart';
import '../../../questions/ui/pages/question_page.dart';
import '../widgets/profile_picture.dart';
import 'personal_data_page.dart';
import 'student_identity_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static String get route => '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final UserSession userSession;

  Future<void> logout() async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ConfirmationModal(
        title: 'Sair da conta',
        description:
            'Você será redirecionado e poderá realizar o login novamente depois.',
        style: ConfirmationModalStyle.negative,
        confirmationText: 'Sair da conta',
        onConfirmationTap: userSession.logout,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    userSession = Injector.resolve();
  }

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.viewPaddingOf(context).bottom;

    var user = userSession.user;

    return Scaffold(
      appBar: DefaultAppBar(
        shape: LinearBorder.none,
        backgroundColor: PrimaryColors.brand,
        foregroundColor: Colors.white,
      ),
      backgroundColor: PrimaryColors.brand,
      bottomSheet: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: bottomPadding + 16,
        ),
        child: SolidButton.transparent(
          label: 'Sair da conta',
          icon: PhosphorIconsRegular.signOut,
          foregroundColor: SemanticColors.negative,
          onPressed: logout,
        ),
      ),
      body: user == null
          ? Container(color: MonoChromaticColors.backgroundColor)
          : Column(
              children: [
                ListenableBuilder(
                  listenable: userSession,
                  builder: (_, __) {
                    if (userSession.isLogged) user = userSession.user;

                    return Column(
                      children: [
                        ProfilePicture(user: user!),
                        const SizedBox(height: 16),
                        Text(
                          user!.name,
                          textAlign: TextAlign.center,
                          style: const Text1Typography(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Aluno  •  ${user!.registrationNumber}',
                          textAlign: TextAlign.center,
                          style: const Text2Typography(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  },
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
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 16 + bottomPadding,
                      ),
                      child: Column(
                        children: [
                          DefaultListTile(
                            backgroundColor: MonoChromaticColors.gray.v100,
                            items: [
                              DefaultListTileItem(
                                title: 'Dados pessoais',
                                icon: PhosphorIconsRegular.student,
                                onTap: () =>
                                    context.push(PersonalDataPage.route),
                              ),
                              DefaultListTileItem(
                                title: 'Carteirinha',
                                icon: PhosphorIconsRegular.creditCard,
                                onTap: () =>
                                    context.push(StudentIdentityPage.route),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          SolidButton.primary(
                            label: 'Ajuda',
                            icon: PhosphorIconsRegular.question,
                            style: SolidButtonStyle.outlined,
                            onPressed: () => context.push(QuestionPage.route),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
