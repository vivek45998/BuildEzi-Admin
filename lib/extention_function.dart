import 'package:email_validator/email_validator.dart';

extension StringExtension on String {
  bool isValidEmail(String email) {
    bool isValid = EmailValidator.validate(email);
    return isValid;
  }
}
