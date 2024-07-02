import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:TShop/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:TShop/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/data/repositories/authentication/authentication_repository.dart';
import 'package:TShop/features/personalization/screens/address/address.dart';
import 'package:TShop/features/shop/screens/cart/cart.dart';
import 'package:TShop/features/personalization/screens/profile/profile.dart';
import 'package:TShop/features/shop/screens/order/order.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          ///Header
          TPrimaryHeaderContainer(
              child: Column(
            children: [
              /// AppBar
              TAppBar(
                title: Text(
                  'Tài khoản',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: TColors.white),
                ),
              ),

              ///User profile card
              TUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen())),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          )),

          ///Body
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Account settings
                const TSectionHeading(
                  title: "Cài đặt tài khoản",
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                TSettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: "Địa chỉ",
                  subTitle: "Đặt địa chỉ giao hàng mua sắm",
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: "Giỏ hàng",
                  subTitle: "Thêm, xóa sản phẩm và chuyển sang thanh toán",
                  onTap: () => Get.to(() => const CartScreen()),
                ),
                TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "Hóa đơn",
                    subTitle: "Đơn hàng đang xử lý và đã hoàn thành",
                    onTap: () => Get.to(() => const OrderScreen())),
                TSettingsMenuTile(
                  icon: Iconsax.bank,
                  title: "Tài khoản ngân hàng",
                  subTitle: "Rút số dư để đăng ký tài khoản ngân hàng",
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: "Ưu đãi của tôi",
                  subTitle: "Danh sách tất cả các phiếu giảm giá",
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.notification,
                  title: "Thông báo",
                  subTitle: "Đặt bất kỳ loại tin nhắn thông báo nào",
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: "Chính sách tài khoản",
                  subTitle:
                      "Quản lý việc sử dụng dữ liệu và tài khoản được kết nối",
                  onTap: () {},
                ),

                /// --- App settings
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TSectionHeading(
                  title: "Cài đặt ứng dụng",
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TSettingsMenuTile(
                  icon: Iconsax.document_upload,
                  title: "Tải dữ liệu",
                  subTitle: "Tải dữ liệu lên Cloud Firebase của bạn",
                ),
                TSettingsMenuTile(
                  icon: Iconsax.location,
                  title: "Định vị địa lý",
                  subTitle: "Đặt đề xuất dựa trên vị trí",
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_user,
                  title: "Chế độ an toàn",
                  subTitle: "Kết quả tìm kiếm an toàn cho mọi lứa tuổi",
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image,
                  title: "Chất lượng hình ảnh HD",
                  subTitle: "Đặt chất lượng hình ảnh để xem",
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),

                ///Logout button
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 148, 12,
                                2)), // Thiết lập màu của đường viền
                      ),
                      child: const Text("Đăng xuất"),
                    )),
                const SizedBox(height: TSizes.spaceBtwSections * 2.5),
              ],
            ),
          )
        ],
      )),
    );
  }
}
