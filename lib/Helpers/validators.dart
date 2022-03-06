class Validators {
  static String? validateField(String? value, {String? errorMessage}) {
    if (value == null || value.isEmpty) {
      return errorMessage ?? 'Empty Field';
    }
    return null;
  }
}
