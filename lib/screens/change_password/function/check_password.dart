mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 6;
  bool isConfirmPasswordValid(String password, String confirmpassword) {
    if (password == confirmpassword) {
      return true;
    }
    return false;
  }
}
