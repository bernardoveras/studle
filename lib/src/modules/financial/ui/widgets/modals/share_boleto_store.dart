import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../core/exceptions/generic_exception.dart';
import '../../../../../core/exceptions/unknow_exception.dart';
import '../../../../../core/mixins/loading_change_notifier_mixin.dart';
import '../../../../../core/utils/hide_keyboard.dart';

class ShareBoletoStore extends ChangeNotifier with LoadingChangeNotifierMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';

  void changeEmail(String value) {
    email = value;
    notifyListeners();
  }

  bool get isValid {
    return formKey.currentState?.validate() ?? false;
  }

  AsyncResult<bool, GenericException> submit() async {
    try {
      changeLoading(true);

      hideKeyboard();

      if (!isValid) return Failure(UnknowException());

      await Future.delayed(const Duration(seconds: 1));

      return const Success(true);
    } finally {
      changeLoading(false);
    }
  }
}
