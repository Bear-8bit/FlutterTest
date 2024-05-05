import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/icon/square_icons.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SquareIcons(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSize.md,
          color: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.white,
          backgroundColor: THelperFunctions.isDarkMode(context) ? Colors.black : Colors.black,
        ),
        const SizedBox(width: TSize.spaceBtwItem),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSize.spaceBtwItem),
    
        const SquareIcons(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSize.md,
          color: Colors.white,
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}

