import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/widgets/tiles/default_list_tile.dart';
import '../../../../core/user_session.dart';
import '../../../../core/utils/nullable_value.dart';
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
  late final UserSession userSession;

  Future<void> removeCurrentPicture() async {
    final updatedUser =
        widget.user.copyWith(pictureUrl: const NullableValue(null));
    userSession.setUser(updatedUser);
    context.pop();
  }

  Future<void> changeCurrentPicture() async {
    //TODO: Implementar método para obter foto da biblioteca ou da câmera.
    final updatedUser = widget.user.copyWith(
        pictureUrl: const NullableValue(
            'https://avatars.githubusercontent.com/u/56937988?v=4'));
    userSession.setUser(updatedUser);
    context.pop();
  }

  Future<void> editPicture() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DefaultModal(
        title: 'Editar Foto',
        child: Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: DefaultListTile(
              dividerColor: MonoChromaticColors.gray.v200,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              items: [
                DefaultListTileItem(
                  icon: PhosphorIconsRegular.images,
                  title: 'Escolher na biblioteca',
                  onTap: changeCurrentPicture,
                ),
                DefaultListTileItem(
                  icon: PhosphorIconsRegular.camera,
                  title: 'Tirar foto',
                  onTap: changeCurrentPicture,
                ),
                DefaultListTileItem(
                  icon: PhosphorIconsRegular.trashSimple,
                  title: 'Remover foto atual',
                  onTap: removeCurrentPicture,
                ),
              ],
            ),
          ),
        ),
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

class DefaultModal extends StatelessWidget {
  const DefaultModal({
    super.key,
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.85,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: 16 + bottomPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultModalHeader(title: title),
            child,
          ],
        ),
      ),
    );
  }
}

class DefaultModalHeader extends StatelessWidget {
  const DefaultModalHeader({
    super.key,
    this.title,
  });
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MonoChromaticColors.gray.v100,
            width: 2,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.square(dimension: 72),
          if (title != null)
            Text(
              title!,
              style: Text1Typography(
                fontWeight: FontWeight.w600,
                color: MonoChromaticColors.gray.v900,
              ),
            ),
          GestureDetector(
            onTap: () => context.pop(),
            behavior: HitTestBehavior.opaque,
            child: SizedBox.square(
              dimension: 72,
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  PhosphorIconsBold.x,
                  color: MonoChromaticColors.gray,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
