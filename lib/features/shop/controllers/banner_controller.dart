
import 'package:TShop/data/repositories/Banners/banner_repository.dart';
import 'package:TShop/features/shop/models/banner_model.dart';
import 'package:TShop/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {

    final isLoading = false.obs;
    final carousalCurrentIndex = 0.obs;
    final RxList <BannerModel> banners = <BannerModel>[].obs;


    @override
  void onInit() {
    //fetch banners
    fetchBanners();
    super.onInit();
  } //update carousal index
    void updateCarousalIndex(int index) {
        carousalCurrentIndex.value = index;
    }
    //fetch banners
    Future<void> fetchBanners() async {
      try {
        // Show loader while loading banners
        isLoading.value = true;

        // Fetch banners from data source (Firestore, API, etc.)
        final bannerRepo = Get.put(BannerRepository());
        final banners = await bannerRepo.fecthAllBanners();

        // Update the list of banners
        this.banners.assignAll(banners);

      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
      } finally {
        //remove loader
        isLoading.value = false;
      }
    }
}