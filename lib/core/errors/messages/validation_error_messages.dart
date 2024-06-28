class ValidationErrorTexts {
  ValidationErrorTexts._();

  static String? fullNameValidation(String? fullName) {
    if (fullName == null || fullName.isEmpty || fullName.trim().isEmpty) {
      return 'Please enter your full name.';
    }
    if (fullName.contains(RegExp(r'[^\w\s]+')) || fullName.contains('_')) {
      return 'Please enter a valid full name.';
    }
    if (fullName.contains(RegExp(r'\s{2,}'))) {
      return 'Full name cannot have more than one consecutive spaces';
    }
    if (!fullName.contains(RegExp(r'\D+'))) {
      return 'Please do not use numbers.';
    }
    if (fullName.length < 2) {
      return 'Full name must be at least 2 characters.';
    }
    return null;
  }
  static String? categoryValidation(String? category) {
    if (category == null || category.isEmpty || category.trim().isEmpty) {
      return 'Please enter your bussiness type.';
    }
    if (category.contains(RegExp(r'[^\w\s]+')) || category.contains('_')) {
      return 'Please enter a valid bussiness type.';
    }
    if (category.contains(RegExp(r'\s{2,}'))) {
      return 'Bussiness type cannot have more than one consecutive spaces';
    }
    if (!category.contains(RegExp(r'\D+'))) {
      return 'Please do not use numbers.';
    }
    if (category.length < 2) {
      return 'Bussiness type must be at least 2 characters.';
    }
    return null;
  }

  static String? urlValidation(String? link) {
    if (link == null || link.isEmpty) {
      return 'Please enter an url.';
    }
    if (!RegExp(
            r'^(https?://)?(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+(/[^\s]*)?$')
        .hasMatch(link)) {
      return 'Invalid URL format';
    }
    return null;
  }

  static String? otpValidation(
    String? field,
  ) {
    if (field == null || field.isEmpty) {
      return 'Please enter the OTP.';
    }
    if (field.contains(RegExp(r'[^\w\s]+')) || field.contains('_')) {
      return 'Please enter valid OTP.';
    }
    if (field.contains(RegExp(r'[A-Z a-z]'))) {
      return 'Please enter valid OTP.';
    }
    if (field.length < 4) {
      return 'OTP must be at least 4 characters.';
    }
    return null;
  }

  static String? signUpPasswordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    if (!password.contains(RegExp(r'[!@#$%^&*\-+=_(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }
    if (password.contains(' ')) {
      return 'Please do not use spaces.';
    }
    return null;
  }

  static String? loginPasswordValidation(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    if (password.contains(' ')) {
      return 'Please do not use spaces.';
    }
    return null;
  }

  static String? confirmPasswordValidation(
    String? passwordConfirmation,
    String? password,
  ) {
    if (passwordConfirmation == null || passwordConfirmation.isEmpty) {
      return 'Please confirm your password.';
    }
    if (password != passwordConfirmation) {
      return 'Passwords do not match.';
    }
    if (passwordConfirmation.contains(' ')) {
      return 'Please do not use spaces.';
    }
    return null;
  }

  static String? emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter an email address.';
    }
    if (email.length < 5 ||
        !RegExp(r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,}$')
            .hasMatch(email)) {
      return 'Please enter a valid email address.';
    }

    if (email.contains(' ')) {
      return 'Please do not use spaces.';
    }
    return null;
  }
}
