import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/icon/circular_icons.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/brands_title_with_verified_icon.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_price_text.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_title_text.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSize.productImageRadius),
        color: dark ? Colors.black : Colors.white,
      ),
      child: Row(
        children: [
          // Thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSize.sm),
            backgroundColor: dark ? Colors.black : Colors.white,
            child: Stack(
              children: [
              // Thumbnail Image
              const SizedBox(
                height: 120,
                width: 120,
                child: RoundedImage(imageUrl: 'assets/image/product/scaleproduct.jpg', applyImageRadius: true)),

                // Sale Tag
              Positioned(
                top: 12,
                child: RoundedContainer(
                  radius: TSize.sm,
                  backgroundColor: Colors.black.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(horizontal: TSize.sm, vertical: TSize.xs),
                  child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                ),
              ),

              const Positioned(
                top: 0,
                right: 0,
                child: CircularIcons(icon: Iconsax.heart5, color: Colors.red),
              ),
              ],
            ),
          ),

          // Detail
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSize.sm, left: TSize.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'Figure 1', smallSize: true),
                      SizedBox(height: TSize.spaceBtwItem / 2),
                      BrandTitleWithVerifiedIcon(title: 'Nikke'),
                    ],
                  ),

                  const Spacer(),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      const Flexible(child: ProductPriceText(price: '256.0')),

                      // Add to Cart
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSize.cardRadiusMd),
                            bottomRight: Radius.circular(TSize.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSize.iconLg * 1.2,
                          height: TSize.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: Colors.white)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}