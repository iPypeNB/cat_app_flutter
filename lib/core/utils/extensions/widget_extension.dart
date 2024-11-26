import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  void validateFormThenAction({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    VoidCallback? action,
  }) {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;

    action?.call();
  }
}
