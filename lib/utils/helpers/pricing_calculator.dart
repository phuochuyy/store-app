class TPricingCalculator {
  /// Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// Calculate shipping cost
  static double calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);

    return shippingCost;
  }

  /// Calculate tax
  static double calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    return taxAmount;
  }

  static double getTaxRateForLocation(String location) {
    return 0.1;
  }

  static double getShippingCost(String location) {
    return 5.0;
  }
}
