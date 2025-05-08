

import '../localization/app_localizations.dart';

String? emailValidation(String? value, context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.translate('email_validation_1');
  }

// Regular expression for basic email validation
  final emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegExp.hasMatch(value)) {
    return AppLocalizations.of(context)!.translate('email_validation_2');
  }

  return null;
}
