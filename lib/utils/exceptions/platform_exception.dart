class TPlatformException {
  final String code;

  // Constructor that takes on error code
  TPlatformException(this.code);

  // Correspondance error message based on error code
  String get message {
    switch (code) {
      case "INVALID_LOGIN_CREDENTIALS":
        return "INVALID LOGIN CREDENTIALS. PLEASE DOUBLE-CHECK YOUR INFORMATION.";

      case "too-many-requests":
        return "Too many requests. Please try again later";

      case 'invalid-argument':
        return 'ivalid argument provided to the authentication method';

      case 'invalid-phone-number':
        return 'The provided phone number is invalid';

      case 'uid-already-exists':
        return 'the provided user ID is already in use by another user.';

      case 'sign_in_failed':
        return 'Sign-in failed. Please try again';

      case 'internal-error':
        return 'Internal error. Please try again later';

      case 'network-request-failed':
        return 'Check your internet connectivity';

      case 'invalid-verification-code':
        return 'Invalid verification code';

      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again';

      case 'operation-not-allowed':
        return 'the sign in provider is disabled for your firebase project.';

      case 'invalid-password':
        return 'Incorrect password. Please try again';

      case "user-not-found":
        return "No user found with this email.";

      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";

      default:
        return "Login failed. Please try again.";
    }
  }
}
