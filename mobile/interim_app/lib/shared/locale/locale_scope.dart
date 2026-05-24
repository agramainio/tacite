import 'package:flutter/widgets.dart';

import 'locale_controller.dart';

class LocaleScope extends InheritedNotifier<LocaleController> {
  const LocaleScope({
    required LocaleController controller,
    required super.child,
    super.key,
  }) : super(notifier: controller);

  static LocaleController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocaleScope>()?.notifier;
  }

  static LocaleController of(BuildContext context) {
    final controller = maybeOf(context);

    if (controller == null) {
      throw StateError('LocaleScope not found in widget tree.');
    }

    return controller;
  }
}
