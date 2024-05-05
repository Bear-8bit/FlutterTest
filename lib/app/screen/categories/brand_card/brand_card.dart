import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/constant/enums.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/image_container/circle_image.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/brands_title_with_verified_icon.dart';

class BrandsCard extends StatelessWidget {
  const BrandsCard({
    super.key, required this.showBorder, this.onTap,
  });
  
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: RoundedContainer(
    padding: const EdgeInsets.all(TSize.sm),
    showBorder: showBorder,
    backgroundColor: Colors.transparent,
    child: Row(
      children: [
      // -- Icon
      const Flexible(
          child: CircularImage(
          isNetworkImage: false,
          image: 'assets/logo/store_logo_transparent.png',
          backgroundColor: Colors.transparent,
        ),
      ),
      const SizedBox(width: TSize.spaceBtwItem / 2),
      
      // --Text--
      Expanded(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BrandTitleWithVerifiedIcon(title: 'Infinity Studio', brandTextSize: TextSizes.large),
            Text(
              '256 Product',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ), 
    ],),
    ),
    );
  }
}
