import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TListItem extends StatelessWidget {
  const TListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: TSize.spaceBtwItem),
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSize.md),
        backgroundColor: dark ? Colors.black : Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            Row(
              children: [
                // Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: TSize.spaceBtwItem / 2),
      
                // Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.white, fontWeightDelta: 1),
                      ),
                      Text('01 Nov 2024', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                // Icon
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: TSize.iconSm)),
              ],
            ),
            const SizedBox(height: TSize.spaceBtwItem),
      
            // Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSize.spaceBtwItem / 2),
                  
                      // Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSize.spaceBtwItem / 2),
                  
                      // Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text('03 Feb 2025', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}