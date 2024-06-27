class ErrorMessages {
  ErrorMessages._();
  static String errorMessage(String? error) {
    if (error == 'Invalid credentials' || error == 'api.login_failed') {
      return 'Email or Password is incorrect.';
    }
    if (error == 'The email field must be a valid email address.') {
      return 'Email must be a valid email address.';
    }
    if (error == 'The email has already been taken.' ||
        error == 'The email has already been taken. (and 2 more errors)') {
      return 'The email has already been taken.';
    }
    if (error == 'Check your internet connection.') {
      return 'Check your internet connection.';
    }
    if (error == 'Something went wrong , try again later.') {
      return 'Something went wrong , try again later.';
    }
    if (error ==
        'A reset code has already been sent to this email. Please check your email') {
      return 'A reset code has already been sent to this email. Please check your email.';
    }
    if (error == 'The selected email is invalid.') {
      return 'This email is not valid.';
    }
    if (error == 'The token field must be 6 digits.') {
      return 'OTP must be 6 digits.';
    }
    if (error == 'Invalid or expired token') {
      return 'OTP is not valid or it has expired.';
    }
    if (error == null || error.isEmpty) {
      return 'Something went wrong, try again later.';
    } else {
      return 'Something went wrong, try again later.';
    }
  }
}
