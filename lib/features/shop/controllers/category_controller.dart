import 'package:TShop/data/repositories/categories/category_repository.dart';
import 'package:get/get.dart';

import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }
    /// -- Load category data
    Future<void> fetchCategories() async {
      try {
        // Show loader while loading categories
        isLoading.value = true;

        // Fetch categories from data source (Firestore, API, etc.)
        final categories = await _categoryRepository.getAllCategories();

        // Update the list of categories
        allCategories.assignAll(categories);

        //filter featured categories
        featuredCategories().assignAll(
            categories.where((category) => category.isFeatured &&
                category.parentId.isEmpty).take(8).toList());
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      } finally {
        //remove loader
        isLoading.value = false;
      }
    }
}