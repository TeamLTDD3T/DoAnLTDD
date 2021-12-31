mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;
  bool isConfirmPasswordValid(String password, String confirmpassword) {
    if (password == confirmpassword) {
      return true;
    }
    return false;
  }

  bool isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
  }
}
