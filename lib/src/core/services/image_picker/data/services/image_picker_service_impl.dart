import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../exceptions/exceptions.dart';
import '../../domain/exceptions/not_found_exception.dart';
import '../../domain/services/i_image_picker_service.dart';
import '../../enums/image_source_photo_picker_enum.dart';

class ImagePickerServiceImpl implements IImagePickerService {
  final _imagePicker = ImagePicker();

  @override
  AsyncResult<File, GenericException> pick(PhotoPickerSource source) async {
    try {
      final image = await _imagePicker.pickImage(
        source: switch (source) {
          PhotoPickerSource.gallery => ImageSource.gallery,
          PhotoPickerSource.camera => ImageSource.camera
        },
      );

      if (image == null) {
        return Failure(ImageNotChosenException());
      }

      final bytes = await image.readAsBytes();

      final file = File.fromRawPath(bytes);

      return Success(file);
    } catch (e) {
      return Failure(
        UnknowException(
          message: e.toString(),
          error: e,
        ),
      );
    }
  }
}
