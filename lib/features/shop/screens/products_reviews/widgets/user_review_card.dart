import 'package:TShop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:TShop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:TShop/features/shop/controllers/review_controller.dart';
import 'package:TShop/features/shop/models/review_model.dart';
import 'package:TShop/utils/constants/colors.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/size.dart';
import 'package:TShop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.review, required this.isLast});

  final ReviewModel review;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    // final controller = Get.put(UserController());
    final controller = ReviewController.instance;
    final userMap = controller.userMap;

    // final user = userMap[review.userId];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              const CircleAvatar(backgroundImage: AssetImage(TImages.user)),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(review.userFullName, style: Theme.of(context).textTheme.titleLarge)
            ]),
            if (isLast)
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'delete') {
                    controller.deleteReview(review);
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text(
                        'Xóa',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ];
                },
                icon: const Icon(Icons.more_vert),
              ),
            // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))

          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// Review
        Row(
          children: [
            TRatingBarIndicator(rating: double.parse(review.rating)),

            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              review.reviewTime,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Company Review
        TRoundedContainer(
          width: double.infinity,
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReadMoreText(
                  review.review,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        )
      ],
    );
  }
}
