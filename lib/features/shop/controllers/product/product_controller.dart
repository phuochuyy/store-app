
import 'package:TShop/data/repositories/authentication/authentication_repository.dart';
import 'package:TShop/data/repositories/orders/order_repository.dart';
import 'package:TShop/data/repositories/product/product_repository.dart';
import 'package:TShop/features/shop/models/product_model.dart';
import 'package:TShop/features/shop/service/rs_service.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featureProducts = <ProductModel>[].obs;
  RxList<ProductModel> searchedProducts = <ProductModel>[].obs;
  // RxList<ProductModel> searchedRecommendProducts = <ProductModel>[].obs;
  RxList<ProductModel> recommendProducts = <ProductModel>[].obs;

  final searchText = ''.obs;

  final rsService = Get.put(RsService());
  // final orderController = OrderController.instance;
  final orderRepository = OrderRepository.instance;
  RxBool checkIsBoughtOrSearch = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    print("loadData");
    await fetchRecommendationProducts();
    await fetchFeaturedProducts();
    await checkBought();
  }

  Future<void> checkBought() async {
    final orders = await orderRepository.fetchUserOrders();
    if (orders.isNotEmpty && recommendProducts.isNotEmpty) {
      checkIsBoughtOrSearch.value = true;
    }
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      //Show loader while loading Products;
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();
      //Assign Products
      featureProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch Products
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<void> fetchRecommendationProducts() async {
    try {
      isLoading.value = true;
      print("fetchRecommend");

      final userId = AuthenticationRepository.instance.authUser.uid;
      final ids = await rsService.fetchProductIds(userId);

      // Fetch Products
      final products = await productRepository.getProductsByIds(ids);
      recommendProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap fetchrecommend!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //Search product
  Future<void> searchProducts(String query) async {
    searchText.value = query;
    if (query.isEmpty) {
      searchedProducts.assignAll(featureProducts);
    } else {
      searchedProducts.assignAll(
        featureProducts
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
      if (query.length >= 5) {
        fetchRecommendProductById(searchedProducts[0].id);
      }
    }
  }

  Future<void> fetchRecommendProductById(String productId) async {
    try {
      final ids = await rsService.fetchProductIdsSearch(productId);
      // print(ids.length);
      final recommendSearchProducts =
          await productRepository.getProductsByIds(ids);
      featureProducts.assignAll(recommendSearchProducts);
    } catch (e) {
      print(e);
    }
  }

  // Get the product price or price range for variations
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;
    final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    // If no variations exist, return the simple price or sale price
    if (product.productType == 'Single') {
      double priceToConsider =
          product.salePrice > 0 ? product.salePrice : product.originalPrice;

      return formatter.format(priceToConsider);
    } else {
      // Calculate the smallest and largest prices among variations
      for (var variation in product.productVariations!) {
        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.originalPrice;

        // Update smallest and largest prices
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
        // print('sale price: ${variation.salePrice}');
      }

      if (smallestPrice == largestPrice) {
        // print(formatter.format(largestPrice));
        return formatter.format(largestPrice);
      } else {
        // print('${formatter.format(smallestPrice)} - ${formatter.format(largestPrice)}');
        return '${formatter.format(smallestPrice)} - ${formatter.format(largestPrice)}';
      }
    }
  }

  // Calulate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'Có sẵn' : 'Hết hàng';
  }
}
