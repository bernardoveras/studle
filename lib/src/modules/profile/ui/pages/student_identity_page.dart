import 'package:flutter/material.dart';

import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/default_app_bar.dart';
import '../../../../core/user_session.dart';
import '../widgets/student_identity_card.dart';

class StudentIdentityPage extends StatefulWidget {
  const StudentIdentityPage({super.key});

  static String get route => '/profile/studentIdentity';
  static String get subRoute => 'studentIdentity';

  @override
  State<StudentIdentityPage> createState() => _StudentIdentityPageState();
}

class _StudentIdentityPageState extends State<StudentIdentityPage> {
  late final UserSession userSession;

  bool isVerse = false;

  void changeVerse() {
    setState(() {
      isVerse = !isVerse;
    });
  }

  @override
  void initState() {
    super.initState();

    userSession = Injector.resolve();
  }

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.paddingOf(context).bottom;

    var user = userSession.user;

    return Scaffold(
      appBar: DefaultAppBar(
        shape: LinearBorder.none,
        backgroundColor: PrimaryColors.brand,
        foregroundColor: Colors.white,
        title: 'Carteirinha',
      ),
      body: user == null
          ? Container(color: MonoChromaticColors.backgroundColor)
          : LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox.expand(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: 24 + bottomPadding,
                    ),
                    physics: const ClampingScrollPhysics(),
                    child: Stack(
                      children: [
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.2,
                          color: PrimaryColors.brand,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StudentIdentityCard(
                              user: user,
                              isVerse: isVerse,
                            ),
                            const SizedBox(height: 32),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MonoChromaticColors.gray.v300,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: changeVerse,
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        color: !isVerse
                                            ? PrimaryColors.brand
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: !isVerse
                                              ? Colors.transparent
                                              : PrimaryColors.brand,
                                          width: 1.5,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                      child: Text(
                                        'Frente',
                                        style: Button2Typography(
                                          color: !isVerse
                                              ? Colors.white
                                              : PrimaryColors.brand,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: changeVerse,
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        color: isVerse
                                            ? PrimaryColors.brand
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: isVerse
                                              ? Colors.transparent
                                              : PrimaryColors.brand,
                                          width: 1.5,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                      child: Text(
                                        'Verso',
                                        style: Button2Typography(
                                          color: isVerse
                                              ? Colors.white
                                              : PrimaryColors.brand,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
