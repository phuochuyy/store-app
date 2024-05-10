class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) return 'Yêu cầu nhập $fieldName';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Yêu cầu nhập Email';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegExp.hasMatch(value)) {
      return 'Không đúng định dạng Email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Yêu cầu nhập mật khẩu.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Mật khẩu phải có ít nhất 6 ký tự.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Mật khẩu phải có ít nhất một ký tự In hoa.";
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Mật khẩu phải có ít nhất một số.";
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*()\-+=<>,.?{|}~]'))) {
      return "Mật khẩu phải chứa ít nhất một ký tự đặc biệt.";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Yêu cầu nhập số điện thoại.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Số điện thoại không đúng định dạng.';
    }

    return null;
  }
}
