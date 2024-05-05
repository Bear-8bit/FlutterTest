import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/layout/grid_layout.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/section_heading.dart';
import 'package:flutter_store/app/screen/product/product_card/product_card_vertical.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
          Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
      
              // -- Products --
              TSectionHeading(title: 'Bạn có thể thích', onPressed: () {}),
              const SizedBox(height: TSize.spaceBtwItem),
      
              GridLayout(itemCount: 4, itemBuilder: (_,index) => const ProductCardVertical()),
              const SizedBox(height: TSize.spaceBtwItem),
            ],
          ),
        ),
      ],
    );
  }
}