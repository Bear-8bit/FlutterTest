import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_title_text.dart';

class TProductDescription extends StatelessWidget {
  const TProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Description
        RoundedContainer(
          backgroundColor: dark ? Colors.black12 : Colors.grey,
          child: const Column(
            children: [
              //Description
              ProductTitleText(
                title: 'Decription',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSize.spaceBtwItem),
      ],
    );
  }
}