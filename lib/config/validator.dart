String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter your email address.';
  }

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  bool isValid = emailRegex.hasMatch(email);

  if (!isValid) {
    return 'Please enter valid email address.';
  }

  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Please enter your password.';
  }

  final passwordRegex = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)',
  );
  final passwordLengthRegex = RegExp(
    r'[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$',
  );
  bool isValid = passwordRegex.hasMatch(password);
  bool isLengthValid = passwordLengthRegex.hasMatch(password);

  if (!isLengthValid) {
    return 'Password must contain at least 8 characters.';
  }
  if (!isValid) {
    return 'Password must contain case and numbers.';
  }

  return null;
}
