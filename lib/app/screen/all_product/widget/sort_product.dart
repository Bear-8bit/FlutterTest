import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/layout/grid_layout.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/screen/product/product_card/product_card_vertical.dart';
import 'package:iconsax/iconsax.dart';

class TSortProduct extends StatelessWidget {
  const TSortProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Tên', 'Giá tăng dần', 'Giá giảm dần', 'Khuyến mãi', 'Mới nhất', 'Mua nhiều']
            .map((option) => DropdownMenuItem(value: option, child: Text(option)))
            .toList(),
        ),
        const SizedBox(height: TSize.spaceBtwSection),
    
        // Product
        GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical())
      ],
    );
  }
}