import 'package:flutter/material.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../../authentication/domain/entities/user_entity.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 80,
      child: CircleAvatar(
        backgroundColor: PrimaryColors.brand.v700,
        foregroundColor: Colors.white,
        backgroundImage:
            user.hasPicture ? NetworkImage(user.pictureUrl!) : null,
        child: user.hasPicture
            ? null
            : Center(
                child: Text(
                  user.firstLetterName,
                  style: const Heading3Typography(
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
