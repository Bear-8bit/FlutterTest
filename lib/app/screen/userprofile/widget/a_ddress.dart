import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:iconsax/iconsax.dart';

// ignore: camel_case_types
class TA_ddress extends StatelessWidget{
  const TA_ddress({
    super.key, required this.selectAddress
  });

  final bool selectAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(TSize.md),
      showBorder: true,
      backgroundColor: selectAddress ? Colors.red.withOpacity(0.5) : Colors.transparent,
      borderColor: selectAddress
      ? Colors.transparent
      : dark
      ? Colors.black12
      : Colors.grey,
      margin: const EdgeInsets.only(bottom: TSize.spaceBtwItem),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectAddress ? Iconsax.tick_circle5 : null,
              color: selectAddress ? dark ? Colors.white : Colors.black : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '82356 Nguyen Hue',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSize.sm / 2),
              const Text('(+123) ', maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: TSize.sm / 2),
              const Text('Nguyễn Huệ', softWrap: true),
            ],
          ),
        ],
      ),
    );
  }
}