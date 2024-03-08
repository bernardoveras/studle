import 'dart:io';

import 'package:result_dart/result_dart.dart';

import '../../../../exceptions/exceptions.dart';
import '../../enums/image_source_photo_picker_enum.dart';

abstract interface class IImagePickerService {
  AsyncResult<File, GenericException> pick(PhotoPickerSource source);
}
