import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:flutter_store/app/screen/product/widget/cart_icon.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return TAppBar(
    title: Text('Trang chủ', style: Theme.of(context).textTheme.headlineMedium),
    actions: [
        Padding(padding: const EdgeInsets.only(right: 12) ,child: CartIcon(onPressed: () => Get.to(() => const CartScreen()) , iconColor: Colors.black)),
      ],
    );
  }
}
