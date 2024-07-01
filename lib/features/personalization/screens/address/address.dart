import 'package:TShop/common/widgets/appbar/appbar.dart';
import 'package:TShop/features/personalization/controllers/address_controller.dart';
import 'package:TShop/features/personalization/screens/address/add_new_address.dart';
import 'package:TShop/features/personalization/screens/address/widgets/single_address.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: TColors.primary,
          onPressed: () => Get.to(
            () => const AddNewAddressScreen(),
          ),
          child: const Icon(Iconsax.add, color: TColors.white),
        ),
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Địa chỉ',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Obx(
                () => FutureBuilder(
                    // Use key to trigger refresh
                    key: Key(controller.refreshData.value.toString()),
                    future: controller.getAllUserAddresses(),
                    builder: (context, snapshot) {
                      // Helper Function: Handle Loader, No Record, OR Error Message
                      final response =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot);
                      if (response != null) return response;

                      final addresses = snapshot.data!;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: addresses.length,
                          itemBuilder: (_, index) => TSingleAddress(
                                address: addresses[index],
                                onTap: () =>
                                    controller.selectAddress(addresses[index]),
                              ));
                    }),
              )),
        ));
  }
}
