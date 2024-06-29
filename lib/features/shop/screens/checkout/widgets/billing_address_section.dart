import 'package:TShop/common/widgets/texts/section_heading.dart';
import 'package:TShop/features/personalization/controllers/address_controller.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Địa chỉ giao hàng', buttonTitle: 'Thay đổi', onPressed: () => addressController.selectNewAddressPoppup(context)),
    Obx(() =>addressController.selectedAddress.value.id.isNotEmpty
            ? Column(
            children:[
              Text("${addressController.selectedAddress.value.name}", style: Theme.of(context).textTheme.bodyLarge),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text('${addressController.selectedAddress.value.phoneNumber}', style: Theme.of(context).textTheme.bodyMedium),
            ],
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Row(
                children: [
                  const Icon(Icons.location_history, color: Colors.grey, size: 16),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(child: Text('${addressController.selectedAddress.value.street}, ${addressController.selectedAddress.value.city}', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
                ]
              ),
        ],): Text('Chọn địa chỉ giao hàng', style: Theme.of(context).textTheme.bodyMedium),
    )],
    );

  }
}