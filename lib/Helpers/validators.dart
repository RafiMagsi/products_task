class Validators {
  static const int minimumValidLength = 3;
  static String? validateField(String? value, {String? errorMessage}) {
    if (value == null || value.isEmpty) {
      return errorMessage ?? 'Empty Field';
    }
    return null;
  }

  static bool hasValidLength(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (value.length >= 3) {
      return true;
    }
    return false;
  }
}
