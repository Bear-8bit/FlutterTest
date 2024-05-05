
import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/icon/square_icons.dart';
import 'package:iconsax/iconsax.dart';

class WithlistIcon extends StatelessWidget {
  const WithlistIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SquareIcons(width: 40, height: 40,  icon: Iconsax.heart, color: Colors.black, size: 25);
  }
}

