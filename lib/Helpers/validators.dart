class Validators {
  static const int minimumValidLength = 3;

  // Validates if the filed is not empty
  static String? validateField(String? value, {String? errorMessage}) {
    if (value == null || value.isEmpty) {
      return errorMessage ?? 'Empty Field';
    }
    return null;
  }

  // Validates if the text length is valid
  static bool hasValidLength(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (value.length >= minimumValidLength) {
      return true;
    }
    return false;
  }
}
