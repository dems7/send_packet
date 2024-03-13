// Custom exception class to handle various Firebase authentication-related errors.
class TFormatException implements Exception {
  // The error code associated with the exception
  final String message;

  // Default Constructor with a generic error message.
  const TFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  // Create a format exception from a specific error message.
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const TFormatException(
            'The provided phone number format is invalid. Please enter a valid number');
      case 'invalid-date-format':
        return const TFormatException(
            'The date format is invalid. Please enter a valid date');
      case 'invalid-url-format':
        return const TFormatException(
            'The url format format is invalid. Please enter a valid url');
      case 'invalid-credit-card-format':
        return const TFormatException(
            'The credit format is invalid. Please enter a valid credit card number');
      case 'invalid-numeric-format':
        return const TFormatException('The input should be a numeric format');
      default:
        return const TFormatException('Invalid');
    }
  }
}
