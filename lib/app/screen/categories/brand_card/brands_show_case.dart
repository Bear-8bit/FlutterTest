import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/screen/categories/brand_card/brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key, required this.image,
  });

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: Colors.black,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSize.md),
      margin: const EdgeInsets.only(bottom: TSize.spaceBtwItem),
      child: Column(
        children: [
          // Brand with Producst Count
          const BrandsCard(showBorder: false),
          const SizedBox(height: TSize.spaceBtwItem),
    
          // Brand top 3 Product Image
          Row(
            children: image.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RoundedContainer(
        height: 120,
        padding: const EdgeInsets.all(TSize.sm),
        margin: const EdgeInsets.only(right: TSize.sm),
        backgroundColor: THelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
        child: ClipRRect(borderRadius: BorderRadius.circular(8.0) ,child: Image(fit: BoxFit.cover, image: AssetImage(image))),
      ),
    );
  }
}