class ValidationMixin{
  String validateEmail(String value) {
    if (!value.contains('@'))
      return 'Please enter a valid email';

    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) return 'Password must less 6 Character';
    return null;
  }
}