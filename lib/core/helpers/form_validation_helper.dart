class FormValidationHelper {
  /// Validates if the input is not empty.
  static String? validateRequired(String? value,
      {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  /// Validates if the input is a valid email address.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required.';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  /// Validates if the password meets certain criteria (e.g., length, complexity).
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required.';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long.';
    }
    return null;
  }

  /// Validates if the input matches a specific pattern (e.g., phone number).
  static String? validatePattern(String? value,
      {required String pattern, String errorMessage = 'Invalid format'}) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required.';
    }
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }

  /// Validates if two fields match (e.g., password confirmation).
  static String? validateMatch(String? value, String? matchValue,
      {String fieldName = 'Values'}) {
    if (value != matchValue) {
      return '$fieldName do not match.';
    }
    return null;
  }
}
