import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/helpers/cpf_helper.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../authentication/domain/entities/user_entity.dart';

class StudentIdentityCard extends StatelessWidget {
  const StudentIdentityCard({
    super.key,
    required this.user,
    required this.isVerse,
  });

  final UserEntity user;
  final bool isVerse;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0.2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: MonoChromaticColors.gray.v100,
          width: 0.5,
        ),
      ),
      margin: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  PrimaryColors.brand.v400,
                  PrimaryColors.brand,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: const Border(
                bottom: BorderSide(
                  color: Colors.yellow,
                  width: 5,
                ),
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: const Row(
              children: [
                Icon(
                  PhosphorIconsRegular.student,
                  color: Colors.white,
                  size: 72,
                ),
                SizedBox(width: 16),
                Flexible(
                  child: Text(
                    'Identidade\nEstudantil',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Heading4Typography(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.yellow,
                  width: 5,
                ),
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: !isVerse
                ? Column(
                    key: const ValueKey(0),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Nome',
                            style: Text3Typography(
                              fontWeight: FontWeight.w600,
                              color: MonoChromaticColors.gray.v900,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user.name,
                            style: Text3Typography(
                              color: MonoChromaticColors.gray,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'RA',
                                  style: Text3Typography(
                                    fontWeight: FontWeight.w600,
                                    color: MonoChromaticColors.gray.v900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  user.registrationNumber,
                                  style: Text3Typography(
                                    color: MonoChromaticColors.gray,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Curso',
                                  style: Text3Typography(
                                    fontWeight: FontWeight.w600,
                                    color: MonoChromaticColors.gray.v900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'My School',
                                  style: Text3Typography(
                                    color: MonoChromaticColors.gray,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'CPF',
                                  style: Text3Typography(
                                    fontWeight: FontWeight.w600,
                                    color: MonoChromaticColors.gray.v900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  CpfHelper.format(user.cpf),
                                  style: Text3Typography(
                                    color: MonoChromaticColors.gray,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    key: const ValueKey(1),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Uso pessoal e intransferível.',
                        style: Text3Typography(
                          fontWeight: FontWeight.w600,
                          color: MonoChromaticColors.gray.v900,
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 72,
                          runSpacing: 16,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Validade',
                                  style: Text3Typography(
                                    fontWeight: FontWeight.w600,
                                    color: MonoChromaticColors.gray.v900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  user.validityYear,
                                  style: Text3Typography(
                                    color: MonoChromaticColors.gray,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Início',
                                  style: Text3Typography(
                                    fontWeight: FontWeight.w600,
                                    color: MonoChromaticColors.gray.v900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  user.startYear,
                                  style: Text3Typography(
                                    color: MonoChromaticColors.gray,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
