// Custom exception class to handle various Firebase authentication-related errors.
class TFirebaseAuthException implements Exception {
  // the error code associated with the exception
  final String code;

  // Constructor that takes on error code
  TFirebaseAuthException(this.code);

  // Correspondance error message based on error code
  String get message {
    switch (code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";

      case 'weak-password':
        return 'The password is too weak.';

      case 'user-disabled':
        return 'this user account has been disable. Please contact support for assitance';

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";

      case 'network-request-failed':
        return 'Problème de connexion réseau. Veuillez vérifier votre connexion Internet.';

      default:
        return "Login failed. Please try again.";
    }
  }
}
