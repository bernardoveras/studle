import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/ui/design_system/design_system.dart';
import '../../../authentication/domain/entities/user_entity.dart';

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  bool editingPicture = false;

  Future<void> editPicture() async {
    try {
      setState(() => editingPicture = true);

      await showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
        ),
      );
    } finally {
      setState(() => editingPicture = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const profilePictureDimension = 80.0;
    const editButtonDimension = 36.0;

    return GestureDetector(
      onTap: editPicture,
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
                backgroundImage: widget.user.hasPicture
                    ? NetworkImage(widget.user.pictureUrl!)
                    : null,
                child: widget.user.hasPicture
                    ? null
                    : Center(
                        child: Text(
                          widget.user.firstLetterName,
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
              child: Animate(
                target: editingPicture ? 1 : 0,
                effects: [
                  ScaleEffect(
                    begin: const Offset(1, 1),
                    end: Offset.zero,
                    alignment: Alignment.center,
                    curve: Curves.easeInOutCirc,
                    duration: 150.ms,
                  ),
                ],
                child: SizedBox.square(
                  dimension: editButtonDimension,
                  child: DefaultIconButton.solid(
                    icon: PhosphorIconsRegular.pencilSimple,
                    backgroundColor: Colors.white,
                    foregroundColor: PrimaryColors.brand,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
