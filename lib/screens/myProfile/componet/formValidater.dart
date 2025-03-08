class Formvalidater {
   static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    final phoneRegex = RegExp(r'^\d{10}$'); // Validates a 10-digit number
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  // Full name validation 
  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name cannot be empty';
    }
    // if (value.length < 3) {
    //   return 'Full name must be at least 3 characters';
    // }
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$'); // Allows only letters and spaces
    if (!nameRegex.hasMatch(value)) {
      return 'Full name must contain only letters and spaces';
    }
    return null;
  }
}