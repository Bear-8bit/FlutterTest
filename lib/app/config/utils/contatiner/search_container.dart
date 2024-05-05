import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/device/device_utils.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.text, this.icon = Iconsax.search_normal, this.showBackground = true,  this.showBorder = true, this.onTap, this.padding = const EdgeInsets.symmetric(horizontal: TSize.defaultSpace),
  });
  
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
        onTap: onTap,
        child: 
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace),
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSize.md),
          decoration: BoxDecoration(
            color: showBackground ? dark ? Colors.black : Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(TSize.cardRadiusLg),
            border: showBorder ? Border.all(color: Colors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.black12),
              const SizedBox(width: TSize.spaceBtwItem),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    ); 
  }
}
