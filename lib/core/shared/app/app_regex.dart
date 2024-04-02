class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isUserNameValid(String userName) {
    return RegExp(r'^(?=[a-zA-Z0-9ء-ي._]{3,20}$)(?!.*[_.]{2})[^_.].*[^_.]$')
        .hasMatch(userName);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*#?&]{8,}$")
        .hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static bool validateMobile(String phoneNumber) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';

    return RegExp(r'(^(?:[+0]9)?[0-9]{10-9})$').hasMatch(phoneNumber);
  }

  static bool isPhoneNoValid(String? phoneNo, String countryCode) {
    if (phoneNo == null) return false;
    final RegExp regExp;
    if (countryCode == '966') {
      regExp = RegExp(r'(^(?:[+0]9)?[0-9]{9}$)');
    } else {
      regExp = RegExp(r'(^(?:[+0]9)?[0-9]{11}$)');
    }
    return regExp.hasMatch(phoneNo);
  }

  static String passwordValidMassageEn() =>
      'password must contain at least 8 character \n password must contain Symbols (#,@ ...)\n password must contain capital and small character ';
  static String passwordValidMassageAr() =>
      ' لابد ان تحتوى كلمة المرور على حرف كبير و حرف صغير \n لابد ان تحتوى كلمة المرور على رموز(#و@..) \n لابد ان لا تقل كلمة المرور عن 8 حروف';

  // static String validatePhoneNumber(String? value) {
  //   String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
  //   RegExp regex = RegExp(pattern);
  //
  //   if (value == null || value.isEmpty || !regex.hasMatch(value)) {
  //     return (checkDirection(
  //         dirArabic: 'رقم هاتف خاطى', dirEnglish: 'Not vaild Phone num'));
  //   } else {
  //     return null;
  //   }
  // }
}

String emptyValidationMessage(String value) => '$value Can\'t be empty';
String userNameValidationMessage(String value) =>
    '$value must contain 3-20 character without Space';
String userEmailValidationMessage(String value) => 'please enter valid $value ';
String userPhoneValidationMessage(String value) =>
    'please enter valid $value without country code';
String userPasswordValidationMessage(String value) =>
    'please enter valid $value min 8 characters ';
