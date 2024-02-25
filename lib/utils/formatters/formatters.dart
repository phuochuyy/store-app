import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy')
        .format(date); // Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: "\$")
        .format(amount); // Customize the currency format as needed
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7890
    if (phoneNumber.length == 10) {
      return "(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}";
    } else if (phoneNumber.length == 11 && phoneNumber.startsWith("+")) {
      return "+${phoneNumber.substring(1, 4)} (${phoneNumber.substring(4, 7)}) ${phoneNumber.substring(7, 10)}-${phoneNumber.substring(10)}";
    }
    return phoneNumber;

    // Add more custom phone number formatting logic for different formats if needed.
  }

  // static String internationalFormatPhoneNumber(String phoneNumber) {
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
  //   //extract country code from digits only
  //   String countryCode = '+${digitsOnly.substring(0, 2)}';
  //   digitsOnly = digitsOnly.substring(2);

  //   //add the remaining digits with proper formatting
  //   final formattedNumber = StringBuffer();
  //   formattedNumber.write('($countryCode) ');

  //   int i = 0;
  //   while (i < digitsOnly.length) {
  //     int groupLenght = 2;
  //     if (i == 0 && countryCode == '+1') {
  //       groupLenght = 3;
  //     }

  //     int end = i + groupLenght;
  //     formattedNumber.write(digitsOnly.substring(i, end));

  //     if (end < digitsOnly.length) {
  //       formattedNumber.write(' ');
  //     }
  //     i = end;
  //   }
  // }

  String internationalFormatPhoneNumber(String phoneNumber) {
    // // Ensure the phone number is not empty or null
    // if (phoneNumber == null || phoneNumber.isEmpty) {
    //   throw FormatException("Phone number cannot be empty or null.");
    // }

    // Remove any non-digit characters from the phone number
    String digitsOnly = phoneNumber.replaceAll(RegExp(r"\D"), "");

    // Extract the country code (if present)
    String countryCode =
        digitsOnly.length >= 2 ? digitsOnly.substring(0, 2) : "";
    if (countryCode.isNotEmpty) {
      digitsOnly = digitsOnly.substring(2);
    }

    // Format the remaining digits
    final formattedNumber = StringBuffer();

    if (countryCode.isNotEmpty) {
      formattedNumber.write('($countryCode) ');
    }

    for (int i = 0; i < digitsOnly.length; i += 3) {
      int groupLength = i == 0 && countryCode == '+1' ? 3 : 2;
      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));
      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
    }

    return formattedNumber.toString();
  }
}
