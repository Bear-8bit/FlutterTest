import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:flutter_store/app/screen/product/product_review/widget/rating.dart';
import 'package:flutter_store/app/screen/product/product_review/widget/rating_indicator.dart';
import 'package:flutter_store/app/screen/product/product_review/widget/user_review.dart';
import 'package:flutter_store/app/screen/product/widget/cart_icon.dart';
import 'package:get/get.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: TAppBar(title: Text('Đánh giá sản phẩm', style: Theme.of(context).textTheme.headlineMedium), showBackArrow: true, actions: [Padding(padding: const EdgeInsets.only(right: 12) ,child: CartIcon(onPressed: () => Get.to(() => const CartScreen()) , iconColor: Colors.black))]),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overall product Rating
              const TProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSize.spaceBtwSection),

              // User Review List
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}


