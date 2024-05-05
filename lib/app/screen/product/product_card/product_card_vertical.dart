import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/common/style/shadow.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/icon/square_icons.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_price_text.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_title_text.dart';
import 'package:flutter_store/app/screen/product/product_detail/product_detail.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
      width: 280,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: const [ShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSize.productImageRadius),
        color: dark ? Colors.black : Colors.white,
      ),
      child: Column(
        children: [
          // Thumbnail, Withlist Button, Discount Tag
          RoundedContainer(
            height: 170,
            padding: const EdgeInsets.all(TSize.sm),
            backgroundColor: dark ? Colors.black : Colors.white,
            child: Stack(
              children: [
                // -- Thumbnail Image -- 
                const RoundedImage(imageUrl: 'assets/image/product/scaleproduct4.jpg', applyImageRadius: true),

                // -- Sale Tag --
                Positioned(
                    top: 10,
                    left: 8,
                    child:RoundedContainer(
                    radius: TSize.sm,
                    backgroundColor: Colors.black.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSize.sm, vertical: TSize.xs),
                    child: Text('', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white)),
                  ),
                ),

                const Positioned(
                  top: 0,
                  right: 0,
                  child: SquareIcons(icon: Iconsax.heart, color: Colors.red),
                ), 
              ],
            ),
          ),
          const SizedBox(height: TSize.spaceBtwItem),

          // -- Detail --
          const Padding(
            padding: EdgeInsets.only(left: TSize.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  ProductTitleText(title: 'Figures', smallSize: false),
              ],
            ),
          ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                const Padding( 
                  padding: EdgeInsets.only(left: TSize.sm),
                  child: ProductPriceText(price: '35.0'),
                ),

                ///Add to Cart Button
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
                )
              ],
            ),
          ],
        ),
      ),
    ); 
  }
}

