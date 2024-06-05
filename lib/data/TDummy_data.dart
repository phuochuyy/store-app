
import 'package:TShop/features/shop/models/category_model.dart';
import 'package:TShop/utils/constants/image_string.dart';

List<CategoryModel> getDummyCategories() {
  return [
    CategoryModel(
      id: '3',
      name: 'Category 1',
      image: TImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Category 2',
      image: TImages.animalIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Category 3',
      image: TImages.cosmeticsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Category 4',
      image: TImages.shoeIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Category 5',
      image: TImages.electronicsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '8',
      name: 'Category 6',
      image: TImages.iphoneIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '9',
      name: 'Category 7',
      image: TImages.sportIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '10',
      name: 'Category 8',
      image: TImages.furnitureIcon,
      isFeatured: true,
    ),
    // Add more categories as needed
  ];
}