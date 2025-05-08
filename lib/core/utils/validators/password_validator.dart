import '../localization/app_localizations.dart';

String? passwordValidation(String? value,context) {
  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context)!.translate('password_validation_1');
  }
  if (value.length < 8) {
    return AppLocalizations.of(context)!.translate('password_validation_2');
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return AppLocalizations.of(context)!.translate('password_validation_3');
  }
  // at least one lowercase letter
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return AppLocalizations.of(context)!.translate('password_validation_4');
  }
  // at least one digit
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return AppLocalizations.of(context)!.translate('password_validation_5');
  }
  //at least one special character
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return AppLocalizations.of(context)!.translate('password_validation_6');
  }
  // all ok
  return null;
}
