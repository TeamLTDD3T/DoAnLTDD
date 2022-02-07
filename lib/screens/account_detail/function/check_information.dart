mixin InputValidationMixin {
  String isPhoneValid(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number !';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number !';
    }
    return '';
  }

  String isAddressValid(String address) {
    if (address.length > 255) {
      return 'Exceeded the allowed number of characters !';
    }
    if (address.length == 0) {
      return 'Please enter address !';
    }
    return '';
  }

  String isFullNameValid(String fullname) {
    if (fullname.length > 255) {
      return 'Exceeded the allowed number of characters !';
    }
    if (fullname.length == 0) {
      return 'Please enter fullname !';
    }
    return '';
  }

  bool isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
  }
}
