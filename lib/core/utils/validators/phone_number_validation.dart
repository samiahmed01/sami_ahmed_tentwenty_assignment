String? phoneNumberValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter phone number';
  }

// Check if the phone number has 10 digits
  final phoneRegExp = RegExp(r'^\d+$');
  if (!phoneRegExp.hasMatch(value)) {
    return 'Enter a valid phone number';
  }
  return null;
}