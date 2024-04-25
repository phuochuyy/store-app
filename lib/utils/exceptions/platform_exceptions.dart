class TPlatformException implements Exception {
  final String code;
  TPlatformException(this.code);
  String get message {
    switch (code) {
      case 'INVALIED_LOGIN_CREDENTIALS':
        return 'Thông tin đăng nhập không hợp lệ. Vui lòng kiểm tra lại thông tin của bạn.';
      case 'too-many-requests':
        return 'Quá nhiều yêu cầu. Vui lòng thử lại sau.';
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-phone-number':
        return 'Số điện thoại được cung cấp không hợp lệ.';
      case 'operation-not-allowed':
        return 'Nhà cung cấp đăng nhập bị vô hiệu hóa đối với dự án Firebase của bạn.';
      case 'session-cookie-expired':
        return 'Cookie phiên Firebase đã hết hạn. Vui lòng đăng nhập lại.';
      case 'uid-atready-exists':
        return 'ID người dùng được cung cấp đã được người dùng khác sử dụng.';
      case 'sign_in_failed':
        return 'Đăng nhập không thành công. PI dễ dàng thử lại.';
      case 'network-request-failed':
        return 'Yêu cầu mạng không thành công. Xin vui lòng kiểm tra kết nối Internet của bạn.';
      case 'internal-error':
        return 'Lỗi bên trong. Vui lòng thử lại sau.';
      case 'invalid-verification-code':
        return 'Mã xác minh không hợp lệ. Vui lòng nhập mã hợp lệ.';
      case 'invalid-varification-id':
        return 'Id xác minh không hợp lệ. Vui lòng yêu cầu mã xác minh mới.';
      case 'quota-exceeded':
        return 'Đã vượt quá hạn ngạch. Vui lòng thử lại sau.';
      default:
        return 'Đã xảy ra lỗi nền tảng không mong muốn. Vui lòng thử lại.';
    }
  }
}
