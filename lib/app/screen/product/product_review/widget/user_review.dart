import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/screen/product/product_review/widget/rating_indicator.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage('assets/logo/store_logo_transparent.png')),
                const SizedBox(width: TSize.spaceBtwItem),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem),

        // Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSize.spaceBtwItem),
            Text('01 Nov 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem),
        const ReadMoreText(
          'The user review',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        const SizedBox(height: TSize.spaceBtwItem),
      ],
    );
  }
}