
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/image_container/circular_container.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_banner_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/controller/home_controller.dart';
import 'package:get/get.dart';

class BannerSlide extends StatelessWidget {
  const BannerSlide({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index)
          ),
          items: banners.map((url) => RoundedBanner(imageUrl: url)).toList(),
        ),
        const SizedBox(height: TSize.spaceBtwItem),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CircularContainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex.value == i ? Colors.black : Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
