import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/curved_edge/curved_edge_widget.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class TProductSlider extends StatelessWidget {
  const TProductSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TCurveEdgeWidget(
      child: Container(
        color: dark ? Colors.black12 : Colors.white,
        child: Stack(
          children: [
            // Main Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSize.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage('assets/logo/store_logo_transparent.png'))),
              ),
            ),
    
            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSize.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSize.spaceBtwItem),
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    backgroundColor: dark ? Colors.black : Colors.white,
                    border: Border.all(color: Colors.black),
                    padding: const EdgeInsets.all(TSize.sm),
                    imageUrl: 'assets/logo/store_logo_transparent.png',
                
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}