import '../error/error.dart';

enum AuthStatus {
  successful,
  loginSuccessful,
  wrongPassword,
  emailAlreadyExists,
  invalidEmail,
  weakPassword,
  unknown,
  emailVerifiedError,
  userNotFound,
  requiresRecentLogin,
  nameChange,
  invalidLoginAttempt
}

class AuthExceptionHandler extends Failure {
  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatus.successful:
        errorMessage =
            "Your account has been created, check your mail for a verification link.";
        break;
      case AuthStatus.loginSuccessful:
        errorMessage = "Login successful";
        break;
      case AuthStatus.nameChange:
        errorMessage = "successful";
        break;

      case AuthStatus.requiresRecentLogin:
        errorMessage =
            "This operation is sensitive and requires recent authentication. Log in again before retrying this request.";
        break;

      case AuthStatus.invalidLoginAttempt:
        errorMessage = "Invalid login attempt.";
        break;

      case AuthStatus.weakPassword:
        errorMessage = "Your password should be at least 6 characters.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Your email or password is wrong.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage =
            "The email address is already in use by another account.";
        break;
      case AuthStatus.emailVerifiedError:
        errorMessage = "An email has been sent, please go verify.";
        break;
      case AuthStatus.userNotFound:
        errorMessage = "User dose not exist";
        break;

      default:
        errorMessage = "An error occured. Please try again later.";
    }
    return errorMessage;
  }

  @override
  List<Object?> get props => [];
}
