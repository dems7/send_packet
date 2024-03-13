// Custom exception class to handle various Firebase authentication-related errors.
class TFirebaseException implements Exception {
  // The error code associated with the exception
  final String code;

  // Constructor that takes on error code
  TFirebaseException(this.code);

  // Correspondance error message based on error code
  String get message {
    switch (code) {
      case "unknown":
        return "An unknown Firebase error occurred. Please try again.";

      case "invalid-custom-token":
        return "The custom token format is incorrect. Please check your custom token.";

      case "custom-token-mismatch":
        return "The custom token corresponds to a different audience.";

      case "user-disabled":
        return "User disabled.";

      case 'user-not-found':
        return 'Aucun utilisateur trouvé avec cette adresse e-mail. Veuillez vous inscrire d\'abord.';

      case "invalid-email":
        return "The email address provided is invalid. Please enter a valid email";

      case "email-already-in-use":
        return "The email address is already registered. Please use a differentemail.";

      case "wrong-password":
        return "Incorrect password. Please check your password and try again";

      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';

      case 'provider-already-linked':
        return 'The account is already linked with another provider.';

      case 'network-request-failed':
        return 'Problème de connexion réseau. Veuillez vérifier votre connexion Internet.';

      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';

      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';

      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code. ';

      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';

      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';

      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided ';

      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';

      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.';

      default:
        return "An unexpected Firebase error occured. Please try again.";
    }
  }
}
