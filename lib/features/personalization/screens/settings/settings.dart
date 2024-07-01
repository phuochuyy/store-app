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
                  subTitle: "Set shopping delivery address",
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: "Giỏ hàng",
                  subTitle: "Add, remove products and move to checkout",
                  onTap: () => Get.to(() => const CartScreen()),
                ),
                TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "Hóa đơn",
                    subTitle: "In-process and Completed Orders",
                    onTap: () => Get.to(() => const OrderScreen())),
                TSettingsMenuTile(
                  icon: Iconsax.bank,
                  title: "Tài khoản ngân hàng",
                  subTitle: "Withdraw balance to registerd bank account",
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: "Ưu đãi của tôi",
                  subTitle: "List of all the discounted coupons",
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.notification,
                  title: "Thông báo",
                  subTitle: "Set any kind of notification message",
                  onTap: () {},
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: "Chính sách tài khoản",
                  subTitle: "Manage data usage and connected accounts",
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
                  title: "Load data",
                  subTitle: "Upload Data to your Clod Firebase",
                ),
                TSettingsMenuTile(
                  icon: Iconsax.location,
                  title: "Geolocation",
                  subTitle: "Set recommendation based on location",
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_user,
                  title: "Safe Mode",
                  subTitle: "Search result is safe for all ages",
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image,
                  title: "HD Image Quality",
                  subTitle: "Set image quality to be seen",
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
