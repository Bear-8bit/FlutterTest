import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class BillingSection extends StatelessWidget {
  const BillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal
        const SizedBox(height: TSize.spaceBtwItem / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256', style: Theme.of(context).textTheme.bodyMedium),

          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem / 2),

        // Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem / 2),

        // Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem / 2),

        // Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem / 2),
      ],
    );
  }
}