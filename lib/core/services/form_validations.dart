//EMAIL VALIDATION
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter email';
  }

  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

//VALIDATE PASSWORD
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter password';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}
