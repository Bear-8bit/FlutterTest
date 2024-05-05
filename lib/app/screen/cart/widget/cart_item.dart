import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
          imageUrl: 'assets/image/product/scaleproduct.jpg',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSize.sm),
          backgroundColor: THelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
        ),
        const SizedBox(width: TSize.spaceBtwItem),
    
        // Name, Price
        Expanded(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(child: ProductTitleText(title: 'Figure 1', maxLines: 1)),
          // Attribute
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: '1/7', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    ),
    ],
    );
  }
}