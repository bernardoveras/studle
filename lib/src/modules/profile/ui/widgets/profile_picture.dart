import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
    const profilePictureDimension = 80.0;
    const editButtonDimension = 36.0;

    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: profilePictureDimension,
        width: profilePictureDimension + editButtonDimension,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SizedBox.square(
              dimension: profilePictureDimension,
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
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox.square(
                dimension: editButtonDimension,
                child: DefaultIconButton.solid(
                  icon: PhosphorIconsRegular.pencilSimple,
                  backgroundColor: Colors.white,
                  foregroundColor: PrimaryColors.brand,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
