import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

class InputValidator {
  static String removeCommas(String input) {
    return input.replaceAll(',', '');
  }

  static String? emailValidator(String? str) {
    var ema = str!.toLowerCase().trim();
    if ((Fzregex.hasMatch(ema, FzPattern.email) == false)) {
      return "Enter a valid email address";
    } else {
      return null;
    }
  }

  static String? nameValidator(String? str) {
    var nam = str!.trim();
    if (nam.isEmpty) {
      return "Enter a valid name";
    } else {
      return null;
    }
  }

  static String? passwordValidator(String? str) {
    if ((Fzregex.hasMatch(str!, FzPattern.passwordNormal1) == false)) {
      return "Enter a strong valid password";
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(String? password, confirmPassword) {
    if (password != confirmPassword) {
      return "Confirm password must be the same as password";
    } else {
      return null;
    }
  }

  static String formatDate(DateTime date) {
    var day = date.day.toString().padLeft(2, '0');
    var month = date.month.toString().padLeft(2, '0');
    var year = date.year.toString();

    return '$day/$month/$year';
  }
}
