import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/icon/circular_icons.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context){
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace, vertical: TSize.defaultSpace / 2),
      decoration: BoxDecoration(
        color:  dark ? Colors.black87 : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSize.cardRadiusLg),
          topRight: Radius.circular(TSize.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Row(
            children: [
              const CircularIcons(
                icon: Iconsax.minus,
                backgroundColor: Colors.black87,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              const SizedBox(width: TSize.spaceBtwItem),
                Text('2', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: TSize.spaceBtwItem),
                const CircularIcons(
                icon: Iconsax.add,
                backgroundColor: Colors.black,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ],
          ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSize.md),
              backgroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
            ),
            child: const Text('Thêm vào giỏ hàng')
          ),
        ],
      ),
    );
  }
}