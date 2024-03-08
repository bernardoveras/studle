import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/dependecy_injection/injector.dart';
import '../../../../core/services/image_picker/domain/exceptions/not_found_exception.dart';
import '../../../../core/services/image_picker/domain/services/i_image_picker_service.dart';
import '../../../../core/services/image_picker/enums/image_source_photo_picker_enum.dart';
import '../../../../core/ui/design_system/design_system.dart';
import '../../../../core/ui/services/snackbar/snackbar_service.dart';
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
  late final IImagePickerService imagePickerService;

  bool busy = false;
  void setBusy(bool value) => setState(() => busy = value);

  Future<void> removeCurrentPicture() async {
    final updatedUser =
        widget.user.copyWith(pictureUrl: const NullableValue(null));
    userSession.setUser(updatedUser);
    context.pop();
  }

  Future<bool> requestGalleryPermission() async {
    try {
      Future<PermissionStatus> requestPermission() async {
        if (Platform.isAndroid) {
          final androidInfo = await DeviceInfoPlugin().androidInfo;

          if (androidInfo.version.sdkInt <= 32) {
            return await Permission.storage.request();
          } else {
            return await Permission.photos.request();
          }
        }

        return await Permission.photos.request();
      }

      var permissionStatus = await requestPermission();

      if (permissionStatus.isGranted) {
        return true;
      }

      final isPermanentlyDenied = await requestPermission().isPermanentlyDenied;

      if (isPermanentlyDenied) {
        await AppSettings.openAppSettings();
        return await requestPermission().isGranted;
      }

      permissionStatus = await requestPermission();

      return permissionStatus.isGranted;
    } catch (e) {
      if (mounted) {
        SnackBarService.show(
          context,
          text: e.toString(),
          type: SnackBarType.error,
        );
      }
      rethrow;
    }
  }

  Future<bool> requestCameraPermission() async {
    try {
      Future<PermissionStatus> requestPermission() async {
        return await Permission.camera.request();
      }

      var permissionStatus = await requestPermission();

      if (permissionStatus.isGranted) {
        return true;
      }

      final isPermanentlyDenied = await requestPermission().isPermanentlyDenied;

      if (isPermanentlyDenied) {
        await AppSettings.openAppSettings();
        return await requestPermission().isGranted;
      }

      permissionStatus = await requestPermission();

      return permissionStatus.isGranted;
    } catch (e) {
      if (mounted) {
        SnackBarService.show(
          context,
          text: e.toString(),
          type: SnackBarType.error,
        );
      }
      rethrow;
    }
  }

  Future<File?> pickImageFromGallery() async {
    try {
      setBusy(true);

      final permissionIsGranted = await requestGalleryPermission();

      if (!mounted) return null;

      if (!permissionIsGranted) {
        SnackBarService.show(
          context,
          text: 'Não conseguimos a permisão para acessar a biblioteca.',
          type: SnackBarType.error,
        );
        return null;
      }

      final result = await imagePickerService.pick(PhotoPickerSource.gallery);

      if (!mounted) return null;

      if (result.isError()) {
        final failure = result.exceptionOrNull()!;

        if (failure is! ImageNotChosenException) {
          SnackBarService.show(
            context,
            text: failure.message,
            type: SnackBarType.error,
          );
        }

        return null;
      }

      final updatedUser = widget.user.copyWith(
        pictureUrl: const NullableValue(
            'https://avatars.githubusercontent.com/u/56937988?v=4'),
      );
      userSession.setUser(updatedUser);

      return result.getOrNull();
    } catch (e) {
      SnackBarService.show(
        context,
        text: e.toString(),
        type: SnackBarType.error,
      );
      return null;
    } finally {
      setBusy(false);
    }
  }

  Future<File?> pickImageFromCamera() async {
    try {
      setBusy(true);

      final permissionIsGranted = await requestGalleryPermission();

      if (!mounted) return null;

      if (!permissionIsGranted) {
        SnackBarService.show(
          context,
          text: 'Não conseguimos a permisão para acessar a biblioteca.',
          type: SnackBarType.error,
        );
        return null;
      }

      final result = await imagePickerService.pick(PhotoPickerSource.camera);

      if (!mounted) return null;

      if (result.isError()) {
        final failure = result.exceptionOrNull()!;

        if (failure is! ImageNotChosenException) {
          SnackBarService.show(
            context,
            text: failure.message,
            type: SnackBarType.error,
          );
        }

        return null;
      }

      final updatedUser = widget.user.copyWith(
        pictureUrl: const NullableValue(
            'https://avatars.githubusercontent.com/u/56937988?v=4'),
      );
      userSession.setUser(updatedUser);

      return result.getOrNull();
    } catch (e) {
      SnackBarService.show(
        context,
        text: e.toString(),
        type: SnackBarType.error,
      );
      return null;
    } finally {
      setBusy(false);
    }
  }

  Future<void> editPicture() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => IgnorePointer(
        ignoring: busy,
        child: DefaultModal(
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
                    onTap: () => pickImageFromGallery().then((value) {
                      context.pop();
                    }),
                  ),
                  DefaultListTileItem(
                    icon: PhosphorIconsRegular.camera,
                    title: 'Tirar foto',
                    onTap: () => pickImageFromCamera().then((value) {
                      context.pop();
                    }),
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    userSession = Injector.resolve();
    imagePickerService = Injector.resolve();
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
