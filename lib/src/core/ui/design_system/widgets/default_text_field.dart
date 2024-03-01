import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../../text_constants.dart';
import '../design_system.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField._({
    super.key,
    this.label,
    this.hintText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.autofocus = false,
    this.autovalidateMode,
    this.inputFormatters,
    this.focusNode,
    this.initialValue,
    this.enabled,
    this.obscureText = false,
    this.readOnly = false,
    this.isPassword = false,
    this.loading = false,
    this.suffixIcon,
    this.maxLines = 1,
    this.size,
    this.expands = false,
    this.textAlignVertical,
    this.onTapOutside,
    this.onTap,
  });

  final String? label;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final bool enableSuggestions;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? initialValue;
  final bool? enabled;
  final bool obscureText;
  final bool readOnly;
  final bool isPassword;
  final bool loading;
  final Widget? suffixIcon;
  final int? maxLines;
  final Size? size;
  final bool expands;
  final TextAlignVertical? textAlignVertical;
  final TapRegionCallback? onTapOutside;
  final Function(BuildContext context)? onTap;

  factory DefaultTextField({
    Key? key,
    String? label,
    String? hintText,
    String? errorText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    Iterable<String>? autofillHints,
    bool autocorrect = true,
    bool enableSuggestions = true,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onFieldSubmitted,
    ValueChanged<String>? onChanged,
    bool autofocus = false,
    AutovalidateMode? autovalidateMode,
    List<TextInputFormatter>? inputFormatters,
    FocusNode? focusNode,
    String? initialValue,
    bool? enabled,
    bool obscureText = false,
    bool readOnly = false,
    bool loading = false,
    Widget? suffixIcon,
    int? maxLines = 1,
    Size? size,
    bool expands = false,
    TextAlignVertical? textAlignVertical,
    TapRegionCallback? onTapOutside,
    Function(BuildContext context)? onTap,
  }) {
    return DefaultTextField._(
      key: key,
      label: label,
      hintText: hintText,
      errorText: errorText,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      loading: loading,
      isPassword: false,
      maxLines: maxLines,
      size: size,
      expands: expands,
      textAlignVertical: textAlignVertical,
      onTapOutside: onTapOutside,
      suffixIcon: suffixIcon,
      onTap: onTap,
    );
  }

  factory DefaultTextField.email({
    Key? key,
    String? label,
    String? hintText,
    String? errorText,
    TextEditingController? controller,
    TextInputAction? textInputAction,
    Iterable<String>? autofillHints = const [AutofillHints.email],
    bool autocorrect = false,
    bool enableSuggestions = false,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onFieldSubmitted,
    ValueChanged<String>? onChanged,
    bool autofocus = false,
    AutovalidateMode? autovalidateMode,
    List<TextInputFormatter>? inputFormatters,
    FocusNode? focusNode,
    String? initialValue,
    bool? enabled,
    bool obscureText = false,
    bool readOnly = false,
    bool loading = false,
    TapRegionCallback? onTapOutside,
    Widget? suffixIcon,
  }) {
    return DefaultTextField._(
      key: key,
      keyboardType: TextInputType.emailAddress,
      label: label,
      hintText: hintText,
      errorText: errorText,
      controller: controller,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      validator: Validatorless.multiple([
        if (validator != null) validator,
        Validatorless.email(TextConstants.invalidEmail),
      ]),
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      loading: loading,
      onTapOutside: onTapOutside,
      suffixIcon: suffixIcon,
    );
  }

  // factory DefaultTextField.phoneNumber({
  //   Key? key,
  //   String? label,
  //   String? hintText,
  //   String? errorText,
  //   TextEditingController? controller,
  //   TextInputAction? textInputAction,
  //   Iterable<String>? autofillHints = const [AutofillHints.telephoneNumber],
  //   bool autocorrect = false,
  //   bool enableSuggestions = false,
  //   FormFieldValidator<String>? validator,
  //   ValueChanged<String>? onFieldSubmitted,
  //   ValueChanged<String>? onChanged,
  //   bool autofocus = false,
  //   AutovalidateMode? autovalidateMode,
  //   List<TextInputFormatter>? inputFormatters,
  //   FocusNode? focusNode,
  //   String? initialValue,
  //   bool? enabled,
  //   bool obscureText = false,
  //   bool readOnly = false,
  //   bool loading = false,
  //   TapRegionCallback? onTapOutside,
  //   Widget? suffixIcon,
  // }) {
  //   final phoneMask = PhoneNumberMaskTextInputFormatter();

  //   return DefaultTextField._(
  //     key: key,
  //     keyboardType: TextInputType.phone,
  //     label: label,
  //     hintText: hintText,
  //     errorText: errorText,
  //     controller: controller,
  //     textInputAction: textInputAction,
  //     inputFormatters: inputFormatters ?? [phoneMask],
  //     autofillHints: autofillHints,
  //     autocorrect: autocorrect,
  //     enableSuggestions: enableSuggestions,
  //     validator: Validatorless.multiple([
  //       if (validator != null) validator,
  //       PhoneNumberFormValidator.validate,
  //     ]),
  //     onFieldSubmitted: onFieldSubmitted,
  //     onChanged: onChanged,
  //     autofocus: autofocus,
  //     autovalidateMode: autovalidateMode,
  //     focusNode: focusNode,
  //     initialValue: initialValue,
  //     enabled: enabled,
  //     obscureText: obscureText,
  //     readOnly: readOnly,
  //     loading: loading,
  //     onTapOutside: onTapOutside,
  //     suffixIcon: suffixIcon,
  //   );
  // }

  // factory DefaultTextField.date({
  //   Key? key,
  //   String? label,
  //   String? hintText,
  //   String? errorText,
  //   TextEditingController? controller,
  //   TextInputAction? textInputAction,
  //   Iterable<String>? autofillHints,
  //   bool autocorrect = false,
  //   bool enableSuggestions = false,
  //   FormFieldValidator<String>? validator,
  //   ValueChanged<String>? onFieldSubmitted,
  //   ValueChanged<String>? onChanged,
  //   bool autofocus = false,
  //   AutovalidateMode? autovalidateMode,
  //   List<TextInputFormatter>? inputFormatters,
  //   FocusNode? focusNode,
  //   String? initialValue,
  //   bool? enabled,
  //   bool obscureText = false,
  //   bool readOnly = false,
  //   bool loading = false,
  //   TapRegionCallback? onTapOutside,
  //   Widget? suffixIcon,
  //   String? helpText,
  //   DateTime? initialDate,
  //   DateTime? firstDate,
  //   DateTime? lastDate,
  //   DateTime? currentDate,
  // }) {
  //   return DefaultTextField._(
  //     key: key,
  //     keyboardType: TextInputType.datetime,
  //     label: label,
  //     hintText: hintText,
  //     errorText: errorText,
  //     controller: controller,
  //     textInputAction: textInputAction,
  //     inputFormatters: inputFormatters ?? [dateFormatter],
  //     autofillHints: autofillHints,
  //     autocorrect: autocorrect,
  //     enableSuggestions: enableSuggestions,
  //     validator: Validatorless.multiple([
  //       if (validator != null) validator,
  //       DateFormValidator.validate,
  //     ]),
  //     onFieldSubmitted: onFieldSubmitted,
  //     onChanged: onChanged,
  //     autofocus: autofocus,
  //     autovalidateMode: autovalidateMode,
  //     focusNode: focusNode,
  //     initialValue: initialValue,
  //     enabled: enabled,
  //     obscureText: obscureText,
  //     readOnly: true,
  //     loading: loading,
  //     onTapOutside: onTapOutside,
  //     suffixIcon: suffixIcon,
  //     onTap: (context) async {
  //       if (readOnly) return;

  //       final result = await showDatePicker(
  //         context: context,
  //         initialDate: initialDate ?? DateTime.now(),
  //         firstDate:
  //             firstDate ?? DateTime.now().add(const Duration(days: -365)),
  //         lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)),
  //         confirmText: 'Confirmar',
  //         cancelText: 'Cancelar',
  //         helpText: helpText,
  //         currentDate: currentDate,
  //       );

  //       if (result == null) return;

  //       controller?.text = result.format() ?? '';
  //       onChanged?.call(result.format() ?? '');
  //     },
  //   );
  // }

  // factory DefaultTextField.hour({
  //   Key? key,
  //   String? label,
  //   String? hintText,
  //   String? errorText,
  //   TextEditingController? controller,
  //   TextInputAction? textInputAction,
  //   Iterable<String>? autofillHints,
  //   bool autocorrect = false,
  //   bool enableSuggestions = false,
  //   FormFieldValidator<String>? validator,
  //   ValueChanged<String>? onFieldSubmitted,
  //   ValueChanged<String>? onChanged,
  //   bool autofocus = false,
  //   AutovalidateMode? autovalidateMode,
  //   List<TextInputFormatter>? inputFormatters,
  //   FocusNode? focusNode,
  //   String? initialValue,
  //   bool? enabled,
  //   bool obscureText = false,
  //   bool readOnly = false,
  //   bool loading = false,
  //   TapRegionCallback? onTapOutside,
  //   Widget? suffixIcon,
  // }) {
  //   return DefaultTextField._(
  //     key: key,
  //     keyboardType: TextInputType.number,
  //     label: label,
  //     hintText: hintText,
  //     errorText: errorText,
  //     controller: controller,
  //     textInputAction: textInputAction,
  //     inputFormatters: inputFormatters ?? [hourFormatter],
  //     autofillHints: autofillHints,
  //     autocorrect: autocorrect,
  //     enableSuggestions: enableSuggestions,
  //     validator: Validatorless.multiple([
  //       if (validator != null) validator,
  //       HourFormValidator.validate,
  //     ]),
  //     onFieldSubmitted: onFieldSubmitted,
  //     onChanged: onChanged,
  //     autofocus: autofocus,
  //     autovalidateMode: autovalidateMode,
  //     focusNode: focusNode,
  //     initialValue: initialValue,
  //     enabled: enabled,
  //     obscureText: obscureText,
  //     readOnly: readOnly,
  //     loading: loading,
  //     onTapOutside: onTapOutside,
  //     suffixIcon: suffixIcon,
  //   );
  // }

  // factory DefaultTextField.currency({
  //   Key? key,
  //   String? label,
  //   String? hintText,
  //   String? errorText,
  //   TextEditingController? controller,
  //   TextInputAction? textInputAction,
  //   Iterable<String>? autofillHints,
  //   bool autocorrect = false,
  //   bool enableSuggestions = false,
  //   FormFieldValidator<String>? validator,
  //   ValueChanged<String>? onFieldSubmitted,
  //   ValueChanged<String>? onChanged,
  //   bool autofocus = false,
  //   AutovalidateMode? autovalidateMode,
  //   List<TextInputFormatter>? inputFormatters,
  //   FocusNode? focusNode,
  //   String? initialValue,
  //   bool? enabled,
  //   bool obscureText = false,
  //   bool readOnly = false,
  //   bool loading = false,
  //   TapRegionCallback? onTapOutside,
  //   Widget? suffixIcon,
  // }) {
  //   final currencyMask = CurrencyTextInputFormatter(
  //     prefix: 'R\$ ',
  //     allowNegative: false,
  //     decimalSeparator: ',',
  //     groupSeparator: '.',
  //   );
  //   return DefaultTextField._(
  //     key: key,
  //     keyboardType: TextInputType.number,
  //     label: label,
  //     hintText: hintText,
  //     errorText: errorText,
  //     controller: controller,
  //     textInputAction: textInputAction,
  //     inputFormatters: inputFormatters ?? [currencyMask],
  //     autofillHints: autofillHints,
  //     autocorrect: autocorrect,
  //     enableSuggestions: enableSuggestions,
  //     validator: Validatorless.multiple([
  //       if (validator != null) validator,
  //     ]),
  //     onFieldSubmitted: onFieldSubmitted,
  //     onChanged: onChanged,
  //     autofocus: autofocus,
  //     autovalidateMode: autovalidateMode,
  //     focusNode: focusNode,
  //     initialValue: initialValue,
  //     enabled: enabled,
  //     obscureText: obscureText,
  //     readOnly: readOnly,
  //     loading: loading,
  //     onTapOutside: onTapOutside,
  //     suffixIcon: suffixIcon,
  //   );
  // }

  // factory DefaultTextField.decimal({
  //   Key? key,
  //   String? label,
  //   String? hintText,
  //   String? errorText,
  //   TextEditingController? controller,
  //   TextInputAction? textInputAction,
  //   Iterable<String>? autofillHints,
  //   bool autocorrect = false,
  //   bool enableSuggestions = false,
  //   FormFieldValidator<String>? validator,
  //   ValueChanged<String>? onFieldSubmitted,
  //   ValueChanged<String>? onChanged,
  //   bool autofocus = false,
  //   AutovalidateMode? autovalidateMode,
  //   List<TextInputFormatter>? inputFormatters,
  //   FocusNode? focusNode,
  //   String? initialValue,
  //   bool? enabled,
  //   bool obscureText = false,
  //   bool readOnly = false,
  //   bool loading = false,
  //   TapRegionCallback? onTapOutside,
  //   Widget? suffixIcon,
  // }) {
  //   final decimalMask = NumberTextInputFormatter(
  //     allowNegative: false,
  //     decimalDigits: 0,
  //   );
  //   return DefaultTextField._(
  //     key: key,
  //     keyboardType: TextInputType.number,
  //     label: label,
  //     hintText: hintText,
  //     errorText: errorText,
  //     controller: controller,
  //     textInputAction: textInputAction,
  //     inputFormatters: inputFormatters ?? [decimalMask],
  //     autofillHints: autofillHints,
  //     autocorrect: autocorrect,
  //     enableSuggestions: enableSuggestions,
  //     validator: Validatorless.multiple([
  //       if (validator != null) validator,
  //     ]),
  //     onFieldSubmitted: onFieldSubmitted,
  //     onChanged: onChanged,
  //     autofocus: autofocus,
  //     autovalidateMode: autovalidateMode,
  //     focusNode: focusNode,
  //     initialValue: initialValue,
  //     enabled: enabled,
  //     obscureText: obscureText,
  //     readOnly: readOnly,
  //     loading: loading,
  //     onTapOutside: onTapOutside,
  //     suffixIcon: suffixIcon,
  //   );
  // }

  // factory DefaultTextField.cnpj({
  //   Key? key,
  //   String? label,
  //   String? hintText,
  //   String? errorText,
  //   TextEditingController? controller,
  //   TextInputAction? textInputAction,
  //   Iterable<String>? autofillHints,
  //   bool autocorrect = false,
  //   bool enableSuggestions = false,
  //   FormFieldValidator<String>? validator,
  //   ValueChanged<String>? onFieldSubmitted,
  //   ValueChanged<String>? onChanged,
  //   bool autofocus = false,
  //   AutovalidateMode? autovalidateMode,
  //   List<TextInputFormatter>? inputFormatters,
  //   FocusNode? focusNode,
  //   String? initialValue,
  //   bool? enabled,
  //   bool obscureText = false,
  //   bool readOnly = false,
  //   bool loading = false,
  //   TapRegionCallback? onTapOutside,
  //   Widget? suffixIcon,
  // }) {
  //   final cnpjMask = MaskTextInputFormatter(
  //     mask: '##.###.###/####-##',
  //     filter: {'#': RegExp(r'[0-9]')},
  //     type: MaskAutoCompletionType.lazy,
  //   );

  //   return DefaultTextField._(
  //     key: key,
  //     keyboardType: TextInputType.number,
  //     label: label,
  //     hintText: hintText,
  //     errorText: errorText,
  //     controller: controller,
  //     textInputAction: textInputAction,
  //     inputFormatters: inputFormatters ?? [cnpjMask],
  //     autofillHints: autofillHints,
  //     autocorrect: autocorrect,
  //     enableSuggestions: enableSuggestions,
  //     validator: Validatorless.multiple([
  //       if (validator != null) validator,
  //       CnpjFormValidator.validate,
  //     ]),
  //     onFieldSubmitted: onFieldSubmitted,
  //     onChanged: onChanged,
  //     autofocus: autofocus,
  //     autovalidateMode: autovalidateMode,
  //     focusNode: focusNode,
  //     initialValue: initialValue,
  //     enabled: enabled,
  //     obscureText: obscureText,
  //     readOnly: readOnly,
  //     loading: loading,
  //     onTapOutside: onTapOutside,
  //     suffixIcon: suffixIcon,
  //   );
  // }

  // factory DefaultTextField.cpf({
  //   Key? key,
  //   String? label,
  //   String? hintText,
  //   String? errorText,
  //   TextEditingController? controller,
  //   TextInputAction? textInputAction,
  //   Iterable<String>? autofillHints,
  //   bool autocorrect = false,
  //   bool enableSuggestions = false,
  //   FormFieldValidator<String>? validator,
  //   ValueChanged<String>? onFieldSubmitted,
  //   ValueChanged<String>? onChanged,
  //   bool autofocus = false,
  //   AutovalidateMode? autovalidateMode,
  //   List<TextInputFormatter>? inputFormatters,
  //   FocusNode? focusNode,
  //   String? initialValue,
  //   bool? enabled,
  //   bool obscureText = false,
  //   bool readOnly = false,
  //   bool loading = false,
  //   TapRegionCallback? onTapOutside,
  //   Widget? suffixIcon,
  // }) {
  //   final cpfMask = MaskTextInputFormatter(
  //     mask: '###.###.###-##',
  //     filter: {'#': RegExp(r'[0-9]')},
  //     type: MaskAutoCompletionType.lazy,
  //   );

  //   return DefaultTextField._(
  //     key: key,
  //     keyboardType: TextInputType.number,
  //     label: label,
  //     hintText: hintText,
  //     errorText: errorText,
  //     controller: controller,
  //     textInputAction: textInputAction,
  //     inputFormatters: inputFormatters ?? [cpfMask],
  //     autofillHints: autofillHints,
  //     autocorrect: autocorrect,
  //     enableSuggestions: enableSuggestions,
  //     validator: Validatorless.multiple([
  //       if (validator != null) validator,
  //       CpfFormValidator.validate,
  //     ]),
  //     onFieldSubmitted: onFieldSubmitted,
  //     onChanged: onChanged,
  //     autofocus: autofocus,
  //     autovalidateMode: autovalidateMode,
  //     focusNode: focusNode,
  //     initialValue: initialValue,
  //     enabled: enabled,
  //     obscureText: obscureText,
  //     readOnly: readOnly,
  //     loading: loading,
  //     onTapOutside: onTapOutside,
  //     suffixIcon: suffixIcon,
  //   );
  // }

  // factory DefaultTextField.cep({
  //   Key? key,
  //   String? label,
  //   String? hintText,
  //   String? errorText,
  //   TextEditingController? controller,
  //   TextInputAction? textInputAction,
  //   Iterable<String>? autofillHints,
  //   bool autocorrect = false,
  //   bool enableSuggestions = false,
  //   FormFieldValidator<String>? validator,
  //   ValueChanged<String>? onFieldSubmitted,
  //   ValueChanged<String>? onChanged,
  //   bool autofocus = false,
  //   AutovalidateMode? autovalidateMode,
  //   List<TextInputFormatter>? inputFormatters,
  //   FocusNode? focusNode,
  //   String? initialValue,
  //   bool? enabled,
  //   bool obscureText = false,
  //   bool readOnly = false,
  //   bool loading = false,
  //   TapRegionCallback? onTapOutside,
  //   Widget? suffixIcon,
  // }) {
  //   final cepMask = MaskTextInputFormatter(
  //     mask: '#####-###',
  //     filter: {'#': RegExp(r'[0-9]')},
  //     type: MaskAutoCompletionType.lazy,
  //   );

  //   return DefaultTextField._(
  //     key: key,
  //     keyboardType: TextInputType.number,
  //     label: label,
  //     hintText: hintText,
  //     errorText: errorText,
  //     controller: controller,
  //     textInputAction: textInputAction,
  //     inputFormatters: inputFormatters ?? [cepMask],
  //     autofillHints: autofillHints,
  //     autocorrect: autocorrect,
  //     enableSuggestions: enableSuggestions,
  //     validator: Validatorless.multiple([
  //       if (validator != null) validator,
  //       CepFormValidator.validate,
  //     ]),
  //     onFieldSubmitted: onFieldSubmitted,
  //     onChanged: onChanged,
  //     autofocus: autofocus,
  //     autovalidateMode: autovalidateMode,
  //     focusNode: focusNode,
  //     initialValue: initialValue,
  //     enabled: enabled,
  //     obscureText: obscureText,
  //     readOnly: readOnly,
  //     loading: loading,
  //     onTapOutside: onTapOutside,
  //     suffixIcon: suffixIcon,
  //   );
  // }

  factory DefaultTextField.password({
    Key? key,
    String? label,
    String? hintText,
    String? errorText,
    TextEditingController? controller,
    TextInputAction? textInputAction,
    Iterable<String>? autofillHints = const [AutofillHints.newPassword],
    TextInputType keyboardType = TextInputType.visiblePassword,
    bool autocorrect = false,
    bool enableSuggestions = false,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onFieldSubmitted,
    ValueChanged<String>? onChanged,
    bool autofocus = false,
    AutovalidateMode? autovalidateMode,
    List<TextInputFormatter>? inputFormatters,
    FocusNode? focusNode,
    String? initialValue,
    bool? enabled,
    bool obscureText = true,
    bool readOnly = false,
    bool loading = false,
    TapRegionCallback? onTapOutside,
    Widget? suffixIcon,
  }) {
    return DefaultTextField._(
      key: key,
      keyboardType: keyboardType,
      label: label,
      hintText: hintText,
      errorText: errorText,
      controller: controller,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      loading: loading,
      isPassword: true,
      onTapOutside: onTapOutside,
      suffixIcon: suffixIcon,
    );
  }

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool isVisible = false;

  void handlePasswordVisibility() {
    setState(() => isVisible = !isVisible);
  }

  @override
  void initState() {
    super.initState();
    isVisible = !widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...{
          Text(
            widget.label!,
            style: Button3Typography(
              fontWeight: FontWeight.w500,
              color: MonoChromaticColors.gray.v600,
            ),
          ),
          const SizedBox(height: 12),
        },
        IgnorePointer(
          ignoring: widget.loading,
          child: SizedBox.fromSize(
            size: widget.size,
            child: TextFormField(
              key: widget.key,
              onTap: () => widget.onTap?.call(context),
              controller: widget.controller,
              expands: widget.expands,
              onTapOutside: widget.onTapOutside,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              inputFormatters: widget.inputFormatters,
              autofillHints: widget.autofillHints,
              autocorrect: widget.autocorrect,
              enableSuggestions: widget.enableSuggestions,
              validator: widget.validator,
              onFieldSubmitted: widget.onFieldSubmitted,
              autofocus: widget.autofocus,
              autovalidateMode: widget.autovalidateMode,
              focusNode: widget.focusNode,
              initialValue: widget.initialValue,
              enabled: widget.enabled,
              onChanged: widget.onChanged,
              obscureText: !isVisible,
              readOnly: widget.readOnly,
              maxLines: widget.maxLines,
              textAlignVertical: widget.textAlignVertical,
              style: Text2Typography(
                color: MonoChromaticColors.gray.v800,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: widget.hintText,
                errorText: widget.errorText,
                suffixIcon: widget.loading
                    ? SizedBox(
                        height: 16.0,
                        width: 16.0,
                        child: Center(
                          child: SizedBox.square(
                            dimension: 16.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: PrimaryColors.brand,
                            ),
                          ),
                        ),
                      )
                    : widget.isPassword
                        ? Focus(
                            descendantsAreFocusable: false,
                            canRequestFocus: false,
                            child: IconButton(
                              icon: Icon(
                                isVisible
                                    ? PhosphorIcons.eye()
                                    : PhosphorIcons.eyeClosed(),
                              ),
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              disabledColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              color: PrimaryColors.brand,
                              onPressed: handlePasswordVisibility,
                            ),
                          )
                        : widget.suffixIcon,
                errorStyle: widget.errorText == ''
                    ? const Button3Typography(
                        height: 0,
                      )
                    : null,
                hintStyle: Text2Typography(
                  fontWeight: FontWeight.w500,
                  color: MonoChromaticColors.gray.v400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: MonoChromaticColors.gray.v300,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: MonoChromaticColors.gray.v300,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: PrimaryColors.brand,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: SemanticColors.negative,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: SemanticColors.negative,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
