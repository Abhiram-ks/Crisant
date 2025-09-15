class ValidatorHelper {
  static String? usernameValidator(String? data) {
    if (data == null || data.isEmpty) {
      return 'This field is required and cannot be empty';
    }
    if (data.length < 3) {
      return 'Entry is too short (min 3 characters)';
    }
    if (data.length > 20) {
      return 'Entry is too long (max 20 characters)';
    }

    final RegExp usernameRegExp = RegExp(r'^[\p{Lu}][\p{L}]*$', unicode: true);

    if (!usernameRegExp.hasMatch(data)) {
      return 'First letter must be uppercase and only letters are allowed';
    }

    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');

    if (!emailRegExp.hasMatch(email)) {
      return 'Enter a valid email address';
    }

    return null;
  }
}
