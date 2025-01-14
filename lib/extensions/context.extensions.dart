import 'package:flutter/material.dart';
import 'package:health_monitor_app_flutter/gen/strings.g.dart';

extension TranslationExtensions on BuildContext {
  /// Returns the current translations from the given [context].
  Translations get t => Translations.of(this);

  /// Returns the ThemeData from the given [context].
  ThemeData get theme => Theme.of(this);
}
