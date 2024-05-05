import 'package:flutter/material.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
    required this.onPressed, required this.iconColor
  });

  final Color? iconColor;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: const Icon(Iconsax.shopping_bag, color: Colors.black)),
        //Positioned(
          //right: 0,
          //child: Container(
            //width: 18,
            //height: 18,
            //decoration: BoxDecoration(
              //color: Colors.black,
              //borderRadius: BorderRadius.circular(100),
            //),
            //child: Center(
              //child: Text('', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white, fontSizeFactor: 0.8)),
            //),
          //),
        //)
      ],
    );
  }
}