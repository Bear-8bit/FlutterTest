

import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_price_text.dart';
import 'package:flutter_store/app/screen/cart/widget/cart_item.dart';
import 'package:flutter_store/app/screen/cart/widget/cart_quantity.dart';

class TCarttItems extends StatelessWidget {
  const TCarttItems({
    super.key, this.QuantityButton = true,
  });

  final bool QuantityButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(height: TSize.spaceBtwSection),
          itemCount: 2,
          itemBuilder: (_, index) => Column(
            children: [
              const CartItem(),
              if(QuantityButton)  const SizedBox(height: TSize.spaceBtwItem),

              if(QuantityButton)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      ProductQuantity(),
                    ],
                  ),
                  ProductPriceText(price: '256'),
                ],
              ),
            ],
          ),
        );
  }
}