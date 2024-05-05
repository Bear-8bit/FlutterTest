import 'package:flutter/material.dart';
import 'package:flutter_store/app/screen/product/product_review/widget/product_review_indicator.dart';

class TProductRating extends StatelessWidget {
  const TProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProcess(text: '5', value: 1.0),
              TRatingProcess(text: '4', value: 0.8),
              TRatingProcess(text: '3', value: 0.6),
              TRatingProcess(text: '2', value: 0.4),
              TRatingProcess(text: '1', value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}

