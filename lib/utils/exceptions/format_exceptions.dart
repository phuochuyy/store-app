class TFormatException implements Exception {
  final String message;

  const TFormatException(
      [this.message =
          'Đã xảy ra lỗi định dạng không mong muốn. Vui lòng kiểm tra đầu vào của bạn.']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-imail-format':
        return const TFormatException(
            'Định dạng địa chỉ email không hợp lệ. Vui lòng nhập email hợp lệ.');
      case ' invalid-phone-number-format':
        return const TFormatException(
            'Định dạng số điện thoại được cung cấp không hợp lệ. Vui lòng nhập một số hợp lệ.');
      case 'invalid-date-format':
        return const TFormatException(
            'Định dạng ngày không hợp lệ. Vui lòng nhập một ngày hợp lệ. ');
      case 'invalid-urt-format':
        return const TFormatException(
            'Định dạng URL không hợp lệ. Vui lòng nhập một URL hợp lệ. ');
      case 'invalid-credit-card-format':
        return const TFormatException(
            'Định dạng thẻ tín dụng không hợp lệ. Vui lòng nhập số thẻ tín dụng hợp lệ.');
      case 'invalid-numeric-format':
        return const TFormatException('Đầu vào phải có định dạng số hợp lệ.');
      default:
        return const TFormatException();
    }
  }
}
