class TFirebaseAuthException implements Exception {
  // the error code associated with the exception
  final String code;

  //Constructor that takes an error code
  TFirebaseAuthException(this.code);

  //Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return "Email đã được sử dụng.";
      case 'invalid-email':
        return "Địa chỉ email không hợp lệ.";
      case 'weak-password':
        return "Mật khẩu quá yếu.";
      case 'user-disabled':
        return "Tài khoản người dùng đã bị vô hiệu hóa.";
      case 'user-not-found':
        return "Không tìm thấy người dùng.";
      case 'wrong-password':
        return "Mật khẩu không chính xác.";
      case 'invalid-verification-code':
        return "Mã xác minh không hợp lệ.";
      case 'invalid-verification-id':
        return "ID xác minh không hợp lệ.";
      case 'quota-exceeded':
        return "Vượt quá hạn ngạch.";
      case 'email-already-exists':
        return "Email đã tồn tại.";
      case 'provider-already-linked':
        return "Nhà cung cấp đã được liên kết.";
      case 'requires-recent-login':
        return "Yêu cầu đăng nhập gần đây.";
      case 'credential-already-in-use':
        return "Chứng chỉ đã được sử dụng.";
      case 'user-mismatch':
        return "Không khớp với người dùng.";
      default:
        return "Lỗi";
    }
  }
}
