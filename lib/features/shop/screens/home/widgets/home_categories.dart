import 'package:TShop/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:TShop/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
              image:
                  'https://salt.tikicdn.com/cache/750x750/ts/product/f7/c5/fd/6abf8e825361fed5de0f9a6f1252af35.jpg.webp',
              title: 'Laptop',
              onTap: () => Get.to(()=> const SubCategoriesScreen()));
        },
      ),
    );
  }
}
