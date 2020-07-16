class ValidationMixin {
  String validatePassword(String value) {
    if (value.length < 4)
      return 'Please enter password of atleast 4 character.';
    return null;
  }

  String validateEmail(String value) {
    if (!value.contains('@')) return 'Please enter a valid email.';
    return null;
  }
}
