import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/constant/enums.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/image_container/circle_image.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/brands_title_with_verified_icon.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_price_text.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_title_text.dart';


class TProductData extends StatelessWidget {
  const TProductData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RoundedContainer(
              radius: TSize.sm,
              backgroundColor: Colors.black.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSize.sm, vertical: TSize.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white)),
            ),
            const SizedBox(width: TSize.spaceBtwItem),

             // Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSize.spaceBtwItem),
            const ProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(width: TSize.spaceBtwItem / 1.5),

        // Name
        const ProductTitleText(title: 'Figure'),
        const SizedBox(height: TSize.spaceBtwItem / 1.5),

        // Stock 
        Row(
          children: [
            const ProductTitleText(title: 'Trạng thái:'),
            const SizedBox(width: TSize.spaceBtwItem),
            Text('Còn hàng', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem / 1.5),

        // Brand
        Row(
          children: [
            CircularImage(
              image: 'assets/logo/store_logo_transparent.png',
              width: 32,
              height: 32,
              overlayColor: dark ? Colors.white : Colors.black,
            ),
            const BrandTitleWithVerifiedIcon(title: 'Nikke', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}